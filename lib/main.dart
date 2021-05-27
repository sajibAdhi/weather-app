import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    getCurrentLocation();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: displayImage(),
            ),
            // SizedBox(height: 50.0),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                'You are in: ',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[500],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Bangladesh',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[500],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.wb_sunny, color: Colors.amber),
                title: Text('Temp 25 C'),
              ),
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
    print('The current time is: $currentTime');

    if (currentTime.contains('AM')) {
      return Image.asset('assets/images/dayTime.jpg');
    } else if (currentTime.contains('PM')) {
      return Image.asset('assets/images/nightTime.jpg');
    }
  }

  // Get Current Location
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      getCityname(position.latitude, position.longitude);
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
