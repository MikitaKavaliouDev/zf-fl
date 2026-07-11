# Flutter Handoff — Push Notification Infrastructure

> **Status:** All server-side code is deployed and live on `main` (zirofit-next).  
> **Date:** 2026-07-11  
> **Base URL:** `https://ziro.fit`  
> **Auth:** Bearer token (auto-injected by `AuthInterceptor`)  
> **Target consumers:** Flutter `lib/` — `NotificationApiService`, `NotificationsCubit`, `main.dart`

---

## Table of Contents

1. [Overview](#overview)
2. [Firebase Console Setup](#1-firebase-console-setup)
3. [Android: Firebase SDK + Config](#2-android-firebase-sdk--config)
4. [iOS: Firebase SDK + Config](#3-ios-firebase-sdk--config)
5. [Flutter: Add Firebase Packages](#4-flutter-add-firebase-packages)
6. [Flutter: Initialize Firebase](#5-flutter-initialize-firebase)
7. [Flutter: FCM Token Registration](#6-flutter-fcm-token-registration)
8. [Flutter: Handle Incoming Push Messages](#7-flutter-handle-incoming-push-messages)
9. [API Reference: Push Token Endpoint](#8-api-reference-push-token-endpoint)
10. [Push Payload Format](#9-push-payload-format)
11. [Testing](#10-testing)
12. [Appendix: Complete Code Diffs](#11-appendix-complete-code-diffs)
13. [Implementation Checklist](#12-implementation-checklist)

---

## Overview

The backend now supports push notifications over Firebase Cloud Messaging (FCM). All 10 server-side notification types (booking requests, session reminders, program assignments, payment confirmations, etc.) are wired to send pushes. The server:

- Stores device tokens per user in the `Device` table (multiple devices supported)
- Tracks platform (`ios` / `android`), OS version, and app version per device
- Routes pushes through Firebase Admin SDK
- Silently cleans up unregistered/invalid tokens

### What the Flutter app needs to do

1. Create Firebase project (Android + iOS apps) — **already done**
2. Download config files (`google-services.json` for Android, `GoogleService-Info.plist` for iOS)
3. Add `firebase_core` + `firebase_messaging` packages to pubspec.yaml
4. Initialize Firebase in `main.dart`
5. Request notification permission and get FCM token
6. Send token to `POST /api/profile/me/push-token`
7. Handle incoming push messages and display local notifications

### Current app state

| Area | Status |
|------|--------|
| `firebase_core` / `firebase_messaging` | ❌ Not in pubspec.yaml |
| `GoogleService-Info.plist` (iOS) | ❌ Missing |
| `google-services.json` (Android) | ❌ Missing |
| `flutter_local_notifications` | ✅ Already installed (`^18.0.1`) |
| Dio with auto auth interceptor | ✅ Ready |
| In-app notification list (Supabase realtime) | ✅ Already works via `NotificationsCubit` |
| Android `applicationId` | `fit.ziro.ziro_fit` |
| iOS deployment target | 13.0 |

---

## 1 — Firebase Console Setup

The Firebase project **zirofit** already exists. You need to register the Flutter apps:

### 1.1 Register Android app

In [Firebase Console → Project Settings → General → Your apps](https://console.firebase.google.com/project/zirofit/settings/general):

1. Click **Add app** → **Android**
2. **Android package name**: `fit.ziro.ziro_fit` (matches `applicationId` in `android/app/build.gradle.kts`)
3. **App nickname**: `Ziro Fit Android`
4. Click **Register app**
5. **Download `google-services.json`** — place at `android/app/google-services.json`
6. Follow the next steps (see section 2 below)

### 1.2 Register iOS app

1. Click **Add app** → **iOS**
2. **Apple bundle ID**: `fit.ziro.ziro_fit` (matches `PRODUCT_BUNDLE_IDENTIFIER` in Xcode)
3. **App nickname**: `Ziro Fit iOS`
4. Click **Register app**
5. **Download `GoogleService-Info.plist`** — place at `ios/Runner/GoogleService-Info.plist`
6. Follow the next steps (see section 3 below)

### 1.3 Upload APNs key (iOS only)

In [Firebase Console → Project Settings → Cloud Messaging](https://console.firebase.google.com/project/zirofit/settings/cloudmessaging):

1. Scroll to **Apple app configuration**
2. Click **Upload**
3. Select the APNs `.p8` key

**Generate the `.p8` key:**

1. Go to [Apple Developer Portal → Certificates, Identifiers & Profiles → Keys](https://developer.apple.com/account/resources/authkeys/add)
2. Enable **Apple Push Notification service (APNs)**
3. Download the `.p8` file (one-time only)
4. Keep **Key ID** and **Team ID** handy — Firebase asks for both

---

## 2 — Android: Firebase SDK + Config

### 2.1 Add `google-services.json`

Place the downloaded file at:

```
android/app/google-services.json
```

### 2.2 Add Google Services plugin

In `android/build.gradle.kts` (project-level), add the Google Services plugin:

```diff
  allprojects {
      repositories {
          google()
          mavenCentral()
      }
  }

+ plugins {
+     id("com.google.gms.google-services") version "4.4.2" apply false
+ }
```

In `android/app/build.gradle.kts` (app-level), apply the plugin:

```diff
  plugins {
      id("com.android.application")
      id("dev.flutter.flutter-gradle-plugin")
+     id("com.google.gms.google-services")
  }
```

### 2.3 Add notification permission

In `android/app/src/main/AndroidManifest.xml`, add:

```diff
  <uses-permission android:name="android.permission.CAMERA" />
  <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
+ <!-- Push notifications (FCM) -->
+ <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

### 2.4 Ensure `minSdk` is at least 21

Firebase Messaging requires `minSdk >= 21`. If `flutter.minSdkVersion` resolves to a lower value, set it explicitly:

```kotlin
defaultConfig {
    applicationId = "fit.ziro.ziro_fit"
    minSdk = 23  // Explicit override if flutter.minSdkVersion < 21
    // ...
}
```

---

## 3 — iOS: Firebase SDK + Config

### 3.1 Add `GoogleService-Info.plist`

Place the downloaded file at:

```
ios/Runner/GoogleService-Info.plist
```

In Xcode (or via the `ios/Runner.xcodeproj`), ensure it's included in the Runner target.

### 3.2 Update iOS minimum version if needed

Firebase requires iOS 13.0+. Your project already targets 13.0, so no change needed.

### 3.3 Add capabilities

In Xcode: **Runner target → Signing & Capabilities → + Capability → Push Notifications**.

Also add **Background Modes** → check **Remote notifications**.

---

## 4 — Flutter: Add Firebase Packages

In `pubspec.yaml`, add:

```diff
  dependencies:
    flutter:
      sdk: flutter
+   firebase_core: ^3.12.0
+   firebase_messaging: ^15.2.0
```

Run:

```bash
flutter pub get
```

Optionally also add `firebase_analytics` if you want delivery stats on the Firebase Console.

---

## 5 — Flutter: Initialize Firebase

### 5.1 Create a push service

Create a new file `lib/core/push/push_service.dart`:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Handles FCM initialization, token management, and incoming push handling.
/// Registered as a singleton via GetIt in main.dart.
class PushService {
  final FlutterLocalNotificationsPlugin _localNotifications;

  PushService(this._localNotifications);

  /// Call once at app startup after Firebase is initialized.
  Future<void> initialize() async {
    // Request notification permission (iOS shows dialog, Android auto-grants)
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('[Push] Permission granted');
    } else {
      print('[Push] Permission denied');
      return;
    }

    // Get FCM token (generates one if none exists)
    final token = await messaging.getToken();
    if (token != null) {
      print('[Push] FCM token: $token');
      await _registerToken(token);
    }

    // Listen for token refresh
    messaging.onTokenRefresh.listen((newToken) {
      print('[Push] Token refreshed: $newToken');
      _registerToken(newToken);
    });

    // Configure local notification display
    await _configureLocalNotifications();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle tap on notification when app was in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Handle tap on notification when app was terminated
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  Future<void> _registerToken(String token) async {
    // Injected via getIt — call the API service to register the token
    // (see section 6 — actual implementation in the API service extension)
    try {
      final pushApiService = GetIt.instance<PushApiService>();
      await pushApiService.registerToken(token);
    } catch (e) {
      print('[Push] Token registration failed: $e');
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
        // Handle notification tap while app is in foreground
        final payload = response.payload;
        if (payload != null) {
          _handleTapPayload(payload);
        }
      },
    );
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;

    // Show a local notification for foreground pushes
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
        payload: data['url'] ?? data['referenceId'],
      );
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    _handleTapPayload(data['url'] ?? data['referenceId'] ?? '');
  }

  void _handleTapPayload(String payload) {
    // Parse and navigate — see deep linking section below
    print('[Push] Tapped: $payload');
    // Post an event or navigate via go_router:
    // If payload starts with "zirofitapp://" or is a UUID referenceId,
    // map to the appropriate route.
    if (payload.startsWith('zirofitapp://')) {
      final uri = Uri.parse(payload);
      final path = uri.path;
      // e.g. /bookings/uuid → navigate to booking detail
      // This should integrate with your existing go_router setup
    }
  }
}
```

### 5.2 Create the API service extension

Create a new file `lib/features/notifications/data/api/push_api_service.dart`:

```dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class PushApiService {
  final Dio _dio;

  PushApiService(this._dio);

  /// POST /api/profile/me/push-token — register this device's FCM token.
  Future<void> registerToken(String token) async {
    await _dio.post(
      '/api/profile/me/push-token',
      data: {
        'token': token,
        'platform': Platform.isAndroid ? 'android' : 'ios',
        'osVersion': Platform.operatingSystemVersion,
        'appVersion': _appVersion,
      },
    );
  }

  String get _appVersion {
    // Use package_info_plus if available, otherwise fallback
    return '1.0.0'; // TODO: replace with actual app version
  }
}
```

> **Note:** The `AuthInterceptor` (already configured in the app) automatically injects the Bearer token — no extra auth headers needed.

---

## 6 — Flutter: FCM Token Registration

The `AuthInterceptor` already handles auth tokens automatically. The `PushService` calls `PushApiService.registerToken()` which uses the existing Dio instance.

### Where to trigger token registration

Token registration should happen:

1. **On every app launch** (after successful auth) — `PushService.initialize()` gets the current token
2. **On auth state change** — when user logs in, re-register the token
3. **On token refresh** — `FirebaseMessaging.onTokenRefresh` listener handles this

### Wire into `main.dart`

```diff
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_local_notifications/flutter_local_notifications.dart';
  import 'package:go_router/go_router.dart';
+ import 'package:firebase_core/firebase_core.dart';
  import 'package:tanquery_flutter/tanquery_flutter.dart';

  import 'core/di/injection.dart' as di;
  // ...

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();

+   // Initialize Firebase
+   await Firebase.initializeApp();

    // Initialize local notifications plugin.
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // ...

    // Register notification plugin as a singleton.
    di.getIt.registerSingleton(flutterLocalNotificationsPlugin);

+   // Initialize push service and register FCM token
+   final pushService = PushService(flutterLocalNotificationsPlugin);
+   di.getIt.registerSingleton(pushService);
+   pushService.initialize();  // Fire-and-forget; registers token in background

    runApp(const ZiroFitApp());
  }
```

### Wire into auth state changes

In `_ZiroFitAppState`, when the user logs in, re-initialize the push service:

```diff
  _authSubscription = _authCubit.stream.listen((state) {
    if (state is AuthAuthenticated) {
+     // Register push token after successful auth
+     di.getIt<PushService>().initialize();
      _notificationsCubit.fetchNotifications();
      // ...
    } else if (state is AuthUnauthenticated) {
+     // FCM token is still valid on the server, but user is logged out.
+     // Optionally delete the token on logout if you want — or leave it
+     // so pushes resume silently on re-login.
      _workoutSessionCubit.reset();
    }
  });
```

---

## 7 — Flutter: Handle Incoming Push Messages

### 7.1 Register backend types for the push notification DTO

Add push-specific types to the API or use the `RemoteMessage.data` map directly. The server sends pushes with this structure:

```dart
/// Typed wrapper around push notification data payload.
class PushNotificationData {
  final String type;         // e.g. "booking_request", "session_reminder"
  final String? referenceId; // UUID of the related resource
  final String? url;         // Deep link (e.g. "zirofitapp://bookings/uuid")

  PushNotificationData._({
    required this.type,
    this.referenceId,
    this.url,
  });

  factory PushNotificationData.fromMap(Map<String, dynamic> data) {
    return PushNotificationData._(
      type: data['type'] as String? ?? '',
      referenceId: data['referenceId'] as String?,
      url: data['url'] as String?,
    );
  }
}
```

### 7.2 Deep linking from pushes

The existing app already handles `zirofitapp://` deep links. Push notification taps should navigate the same way. In the `_handleTapPayload` method, integrate with `go_router`:

```dart
void _handleTapPayload(String payload) {
  if (payload.startsWith('zirofitapp://')) {
    final uri = Uri.parse(payload);
    // Post event to navigate — your existing deep link handler
    // (e.g., NotificationCenter or go_router directly)
  } else if (payload.isNotEmpty) {
    // payload is a referenceId — map to a screen based on push type
    // See PushNotificationData.type
  }
}
```

The app's `AndroidManifest.xml` already has an intent-filter for `zirofitapp://` scheme. iOS already handles it via `onOpenURL`.

### 7.3 Register background message handler

Create a top-level callback for handling pushes when the app is terminated:

```dart
// At the top of main.dart (outside any class)

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase in the background isolate
  await Firebase.initializeApp();
  print('[Push Background] ${message.messageId}');
  // The system shows the notification automatically on Android.
  // On iOS, the system handles it via APNs.
}
```

Register it in `main()` before `Firebase.initializeApp()`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp();
  // ...
}
```

---

## 8 — API Reference: Push Token Endpoint

### `POST /api/profile/me/push-token`

Registers or updates a device push token for the authenticated user.

**Request:**

```json
{
  "token": "fcm-token-string-here",
  "platform": "android",
  "osVersion": "14",
  "appVersion": "1.0.0"
}
```

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `token` | `string` | ✅ | FCM registration token |
| `platform` | `string` | ✅ | `"ios"` or `"android"` |
| `osVersion` | `string?` | ❌ | Android version (e.g. `"14"`) |
| `appVersion` | `string?` | ❌ | App version (e.g. `"1.0.0"`) |

**Success (200/201):**

```json
{
  "data": {
    "message": "Push token registered"
  }
}
```

**Behaviour:**
- If the token already exists for this user → updates OS version / app version (idempotent)
- If the token exists for a different user (device reassigned) → re-assigns to current user
- Surplus tokens for this user on the same platform beyond 5 are pruned (oldest first)

---

## 9 — Push Payload Format

The server sends pushes with this payload structure:

```json
{
  "notification": {
    "title": "Booking Request",
    "body": "You have a new booking request from Alex"
  },
  "data": {
    "type": "booking_request",
    "referenceId": "uuid-here",
    "url": "zirofitapp://bookings/uuid-here"
  }
}
```

### Notification types (`data.type`)

| Type | Trigger | Target |
|------|---------|--------|
| `booking_request` | Client books a session | Trainer |
| `booking_confirmed` | Trainer accepts booking | Client |
| `booking_cancelled` | Either party cancels | The other party |
| `booking_updated` | Trainer reschedules | Client |
| `session_reminder` | 15 min before session | Both |
| `program_assigned` | Trainer assigns a program | Client |
| `exercise_logged` | Client logs exercise | Trainer |
| `checkin_reminder` | Daily check-in prompt | Client |
| `payment_received` | Client pays | Trainer |
| `promotion` | Admin broadcast | All |

### Navigation mapping (suggested)

```dart
import 'package:go_router/go_router.dart';

void navigateFromPush(BuildContext context, PushNotificationData data) {
  switch (data.type) {
    case 'booking_request':
    case 'booking_confirmed':
    case 'booking_cancelled':
    case 'booking_updated':
      if (data.referenceId != null) {
        context.push('/bookings/${data.referenceId}');
      }
    case 'session_reminder':
      if (data.referenceId != null) {
        context.push('/sessions/${data.referenceId}');
      }
    case 'program_assigned':
      context.push('/programs');
    case 'checkin_reminder':
      context.push('/check-in');
    case 'payment_received':
      context.push('/profile/edit?section=billing');
    default:
      if (data.url != null && data.url!.startsWith('zirofitapp://')) {
        // Parse and navigate via existing deep link handler
      }
  }
}
```

---

## 10 — Testing

### 10.1 Prerequisites (Android)

1. **Physical device** — FCM works on emulators with Google Play Services, but real device is more reliable
2. **`google-services.json`** — placed at `android/app/`
3. **Google Services plugin** — configured in `build.gradle.kts`

### 10.2 Prerequisites (iOS)

1. **Physical device** — push notifications don't work on simulator
2. **`GoogleService-Info.plist`** — placed at `ios/Runner/`
3. **APNs `.p8` key** — uploaded to Firebase Console
4. **Apple Developer account** — with App ID that has Push Notifications capability
5. **Provisioning profile** — must include Push Notifications

### 10.3 Test flow

1. Run the app on a physical device
2. Accept the notification permission dialog
3. Check the console for:
   ```
   [Push] FCM token: <long-token-string>
   ```
4. Verify the token reached the server:
   - Check the `Device` table in the database
   - Or use the Firebase Console → Messaging → Send test message

### 10.4 Firebase Console test send

In Firebase Console → **Messaging** → **Send test message** → enter the FCM token from console output.

---

## 11 — Appendix: Complete Code Diffs

### File 1: `pubspec.yaml`

```diff
  dependencies:
    flutter:
      sdk: flutter
+   firebase_core: ^3.12.0
+   firebase_messaging: ^15.2.0
```

### File 2: `android/build.gradle.kts` (project-level)

```diff
+ plugins {
+     id("com.google.gms.google-services") version "4.4.2" apply false
+ }
```

### File 3: `android/app/build.gradle.kts` (app-level)

```diff
  plugins {
      id("com.android.application")
      id("dev.flutter.flutter-gradle-plugin")
+     id("com.google.gms.google-services")
  }
```

### File 4: `android/app/src/main/AndroidManifest.xml`

```diff
+ <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

### File 5: `lib/core/push/push_service.dart` (new)

See full code in [section 5.1](#51-create-a-push-service).

### File 6: `lib/features/notifications/data/api/push_api_service.dart` (new)

See full code in [section 5.2](#52-create-the-api-service-extension).

### File 7: `lib/main.dart`

```diff
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_local_notifications/flutter_local_notifications.dart';
  import 'package:go_router/go_router.dart';
+ import 'package:firebase_core/firebase_core.dart';
  import 'package:tanquery_flutter/tanquery_flutter.dart';

  import 'core/di/injection.dart' as di;
+ import 'core/push/push_service.dart';
  // ...

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();

+   // Background message handler (must be registered before Firebase.init)
+   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
+
+   await Firebase.initializeApp();

    // Initialize local notifications plugin.
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // ...

    // Register notification plugin as a singleton.
    di.getIt.registerSingleton(flutterLocalNotificationsPlugin);

+   // Initialize push service
+   final pushService = PushService(flutterLocalNotificationsPlugin);
+   di.getIt.registerSingleton(pushService);
+   unawaited(pushService.initialize());

    runApp(const ZiroFitApp());
  }

+ /// Top-level background message handler for FCM (runs in its own isolate).
+ @pragma('vm:entry-point')
+ Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
+   await Firebase.initializeApp();
+   print('[Push Background] ${message.messageId}');
+ }
```

Add `dart:async` import for `unawaited`:

```diff
- import 'dart:async';
+ import 'dart:async';
```

And in `_ZiroFitAppState`, add token registration on auth:

```diff
  _authSubscription = _authCubit.stream.listen((state) {
    if (state is AuthAuthenticated) {
+     unawaited(di.getIt<PushService>().initialize());
      _notificationsCubit.fetchNotifications();
      // ...
    }
  });
```

### File 8: `di/injection.config.dart` (auto-generated)

After adding the `@injectable` annotation on `PushApiService`, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This auto-registers `PushApiService` in GetIt.

---

## 12 — Implementation Checklist

- [ ] **Firebase Console:** Register Android app → download `google-services.json`
- [ ] **Firebase Console:** Register iOS app → download `GoogleService-Info.plist`
- [ ] **Firebase Console:** Upload APNs `.p8` key
- [ ] **Android:** Place `google-services.json` at `android/app/`
- [ ] **Android:** Add Google Services plugin to `build.gradle.kts` (project + app)
- [ ] **Android:** Add `POST_NOTIFICATIONS` permission in `AndroidManifest.xml`
- [ ] **Android:** Verify `minSdk >= 21`
- [ ] **iOS:** Place `GoogleService-Info.plist` at `ios/Runner/`
- [ ] **iOS:** Enable Push Notifications + Background Remote notifications capabilities
- [ ] **Flutter:** Add `firebase_core` and `firebase_messaging` to `pubspec.yaml`
- [ ] **Flutter:** Run `flutter pub get`
- [ ] **New file:** `lib/core/push/push_service.dart` — FCM lifecycle + local notification display
- [ ] **New file:** `lib/features/notifications/data/api/push_api_service.dart` — API call with `@injectable`
- [ ] **`main.dart`:** Add `Firebase.initializeApp()` and background handler
- [ ] **`main.dart`:** Register `PushService` singleton and call `initialize()`
- [ ] **`main.dart`:** Re-register token on auth state change (`AuthAuthenticated`)
- [ ] **Run `build_runner`:** `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] **Run on physical device:** Verify FCM token appears in console
- [ ] **Server verification:** Token stored in `Device` table
- [ ] **Integration test:** Trigger a booking request → confirm push received
