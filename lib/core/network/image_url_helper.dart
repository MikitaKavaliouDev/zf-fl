import 'dart:io' show Platform;

/// Default backend URL per platform (mirrors [DioClient]'s logic).
String _defaultBaseUrl() {
  const envUrl = String.fromEnvironment('API_BASE_URL');
  if (envUrl.isNotEmpty) return envUrl;
  if (Platform.isAndroid) return 'http://10.0.2.2:3321';
  return 'http://localhost:3321';
}

/// Constructs a full image URL from a potentially relative [path].
///
/// The backend API may return `profilePhotoPath` as either:
/// - A full URL (e.g. `https://picsum.photos/seed/...`)
/// - A relative path (e.g. `/uploads/profiles/photo.jpg`)
///
/// When [baseUrl] is omitted the helper uses the same platform-aware default
/// as [DioClient] (`http://localhost:3321` on desktop/simulator,
/// `http://10.0.2.2:3321` on Android emulator).
String resolveImageUrl(String? path, {String? baseUrl}) {
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http://') || path.startsWith('https://')) return path;
  final base = baseUrl ?? _defaultBaseUrl();
  final cleanBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
  final cleanPath = path.startsWith('/') ? path : '/$path';
  return '$cleanBase$cleanPath';
}
