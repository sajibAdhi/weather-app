import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/get_location.dart';
import 'package:weather_app/weather_data.dart';

class HttpHandler{
  static const String _apiKey = '0769fb37917d0ed73656a2e17095965b';
  static GetLocation _getLocation  = GetLocation();

  // Get Temp
  Future<WeatherData> getTemp() async {

    var _getLatLoc = _getLocation.getCurrentLocation();

    if(_getLatLoc != null){
      var uri = 'http://api.openweathermap.org/data/2.5/weather?lat=${_getLatLoc.latitude}&lon=${_getLatLoc.longtitude}&appid=$_apiKey&units=metric';
      var url = Uri.parse(uri);
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        return WeatherData.fromJSON(json.decoder(response.body));
      }else{
        throw Exception('Failed to fetch weather data.');
      }
    }
  }
}