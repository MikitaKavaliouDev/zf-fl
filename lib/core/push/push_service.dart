import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import '../../features/notifications/data/api/push_api_service.dart';

/// Handles FCM initialization, token management, and incoming push handling.
///
/// Registered as a singleton via GetIt in main.dart. Covers:
/// - Notification permission request (one-time)
/// - FCM token retrieval and backend registration
/// - Token refresh listener (one-time)
/// - Local notification display for foreground pushes
/// - Deep link navigation from notification taps via [onNavigate] callback
class PushService {
  final FlutterLocalNotificationsPlugin _localNotifications;
  bool _initialized = false;

  /// Callback invoked when a push notification is tapped with a navigable URI.
  ///
  /// Set this from the widget layer (e.g. _ZiroFitAppState) to integrate
  /// with GoRouter navigation. The callback receives the full payload
  ///  (e.g. "zirofitapp://bookings/uuid" or a referenceId).
  void Function(String payload, {Map<String, dynamic>? data})? onNavigate;

  PushService(this._localNotifications);

  /// One-time initialization at app startup (after Firebase initialized).
  ///
  /// Safe to call multiple times — the [_initialized] guard prevents
  /// duplicate setup of permissions, listeners, and notification channels.
  /// This is intentionally fire-and-forget (unawaited) so it doesn't
  /// block app startup.
  ///
  /// For auth-state re-registration, use [reRegisterToken] instead.
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    final messaging = FirebaseMessaging.instance;

    // Request notification permission (iOS shows dialog, Android auto-grants
    // on 13+, requires POST_NOTIFICATIONS in manifest for Android 13+).
    final settings = await messaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized &&
        settings.authorizationStatus != AuthorizationStatus.provisional) {
      developer.log('Push permission denied', name: 'push');
      return;
    }

    developer.log('Push permission granted', name: 'push');

    // Get FCM token and register with backend.
    final token = await messaging.getToken();
    if (token != null) {
      developer.log('FCM token: $token', name: 'push');
      await _registerToken(token);
    }

    // Listen for token refresh (one-time setup — survives app lifetime).
    messaging.onTokenRefresh.listen((newToken) {
      developer.log('Token refreshed: $newToken', name: 'push');
      _registerToken(newToken);
    });

    // Configure local notification display.
    await _configureLocalNotifications();

    // Handle foreground messages — show local notification.
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle tap on notification when app was in background.
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Handle tap on notification when app was terminated.
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  /// Lightweight token re-registration for auth state changes (login / re-auth).
  ///
  /// Does NOT re-request permission, re-setup listeners, or re-configure
  /// notification channels — those are one-time in [initialize]. Only gets
  /// the current FCM token and registers it with the backend.
  Future<void> reRegisterToken() async {
    try {
      final messaging = FirebaseMessaging.instance;
      final token = await messaging.getToken();
      if (token != null) {
        developer.log('Re-registering FCM token: $token', name: 'push');
        await _registerToken(token);
      }
    } catch (e) {
      developer.log('Token re-registration failed: $e', name: 'push');
    }
  }

  Future<void> _registerToken(String token) async {
    try {
      final pushApiService = GetIt.instance<PushApiService>();
      await pushApiService.registerToken(token);
      developer.log('Token registered with backend', name: 'push');
    } catch (e) {
      developer.log('Token registration failed: $e', name: 'push');
    }
  }

  Future<void> _configureLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    );
    await _localNotifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload != null) {
          _handleTapPayload(payload, data: null);
        }
      },
    );
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'push_channel',
            'Push Notifications',
            channelDescription: 'Real-time notifications from ZIRO.FIT',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        payload: message.data['url'] as String? ?? message.data['referenceId'] as String?,
      );
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    _handleTapPayload(data['url'] as String? ?? data['referenceId'] as String? ?? '', data: data);
  }

  void _handleTapPayload(String payload, {Map<String, dynamic>? data}) {
    if (payload.startsWith('zirofitapp://')) {
      final uri = Uri.parse(payload);
      developer.log('Push tap — navigate to: $uri', name: 'push');
      // Invoke the navigation callback so the widget layer can navigate.
      onNavigate?.call(payload, data: data);
    } else if (payload.isNotEmpty) {
      developer.log('Push tap — referenceId: $payload', name: 'push');
      // Invoke the navigation callback with the raw referenceId and data.
      onNavigate?.call(payload, data: data);
    }
  }
}
