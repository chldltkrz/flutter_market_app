import 'package:geolocator/geolocator.dart';

class GeolocatorHelper {
  static Future<Position?> getPosition() async {
    final permission = await Geolocator.checkPermission();
    // 1. 현재 권한이 없을때 권한 요청
    // 2. 권한 요청후 결과가 거부일때 리턴하기
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      final permission2 = await Geolocator.requestPermission();
      if (permission2 == LocationPermission.denied ||
          permission2 == LocationPermission.deniedForever) {
        return null;
      }
    }
    // 3. Geolocator로 위치 가져와서 리턴
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    );
    return position;
  }
}
