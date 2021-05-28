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
      city = await getCityname(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  // Get City Name
  Future<String> getCityname(double lat, double lon) async {
    List<Placemark> placemarks = [];
    print('getCityname');
    try {
      placemarks = await placemarkFromCoordinates(lat, lon);
      print('City Name is: ${placemarks[0].locality}');
    } catch (error) {
      print(error);
    }

    return placemarks[0].locality;
  }

 
}
