import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/get_location.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    getLocation();

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

  // Get Location
  Future<void> getLocation() async {
    GetLocation getLocation = GetLocation();
    await getLocation.getCurrentLocation();

    print(getLocation.latitude);
    print(getLocation.longitude);
    print(getLocation.city);
  }
}
