import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    await requestLocationPermission();

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isDenied) {
      // The user denied the permission
      throw Exception('Location permission is required to use this app.');
    } else if (status.isPermanentlyDenied) {
      // The user permanently denied the permission
      openAppSettings();
    }
  }
}
