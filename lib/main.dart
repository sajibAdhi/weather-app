import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'display_weather_data.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DisplayWeatherData _displayWeatherData = DisplayWeatherData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: displayImage(),
            ),
            SizedBox(height: 50.0),
            Container(
              child: _displayWeatherData,
            ),
          ],
        ),
      ),
    );
  }

  //  Display Image based on current Time
  displayImage() {
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);

    if (currentTime.contains('AM')) {
      return Image.asset('assets/images/dayTime.jpg');
    } else if (currentTime.contains('PM')) {
      return Image.asset('assets/images/nightTime.jpg');
    }
  }
}
