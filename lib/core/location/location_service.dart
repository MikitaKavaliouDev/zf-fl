import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart' as latlong;

@singleton
class LocationService {
  Position? _currentPosition;

  /// Get current device location. Returns null if permissions denied or location unavailable.
  Future<latlong.LatLng?> getCurrentLocation() async {
    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return null;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return null;
      }
      if (permission == LocationPermission.deniedForever) return null;

      _currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ),
      );
      return latlong.LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
    } catch (e) {
      return null;
    }
  }

  /// Stream location updates.
  Stream<latlong.LatLng> get onLocationChanged {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    ).map((p) => latlong.LatLng(p.latitude, p.longitude));
  }
}
