import 'package:geolocator/geolocator.dart';

class GetLocation {
  // Get Current Location
  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.high );

      return position;
    } catch (e) {
      print(e);
    }
  }
}
