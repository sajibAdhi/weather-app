import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      // return position;
    } catch (e) {
      print(e);
    }
  }
}
