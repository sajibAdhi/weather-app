import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      print("GetLocation error $e");
    }
  }
}
