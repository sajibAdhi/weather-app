import 'package:http/http.dart' as http;
import 'dart:convert';
import 'get_location.dart';
import 'weather_data.dart';

class HttpHandler {
  static const String _apiKey = '0769fb37917d0ed73656a2e17095965b';
  static GetLocation _getLocation = GetLocation();

  // Get http Data
  static Future<WeatherData> getHttpData() async {
    var _getLatLoc = await _getLocation.getCurrentLocation();

    if (_getLatLoc != null) {
      var uri =
          'http://api.openweathermap.org/data/2.5/weather?lat=${_getLatLoc.latitude}&lon=${_getLatLoc.longitude}&appid=$_apiKey&units=metric';
      var url = Uri.parse(uri);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return WeatherData.fromJSON(json.decode(response.body));
      }
    }

    return throw Exception('Failed to fetch weather data.');
  }
}
