import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  double latitude;
  double longitude;
  String city;
  // Get Current Location
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      city = await getCityName(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  // Get City Name
  Future<String> getCityName(double lat, double lon) async {
    List<Placemark> placemarks = [];

    try {
      placemarks = await placemarkFromCoordinates(lat, lon, localeIdentifier: "en");
      print('City Name is: ${placemarks[0].locality}');
    } catch (error) {
      print("getCityName error: $error");
    }
    return placemarks[0].locality;

  }

 
}
