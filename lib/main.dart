import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/get_location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  var description;
  var temp;
  String city;

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
                      city.toString(),
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
                title: Text(
                  'Temperature: ${temp.toString()} C',
                ),
                subtitle: Text(
                  'Status ${description.toString()}',
                ),
              ),
            ),
            Container(
              child: Center(
                // ignore: deprecated_member_use
                child: FlatButton(
                  child: Text('Get Weather Info'),
                  color: Colors.blue[500],
                  textColor: Colors.white,
                  onPressed: (){
                    setState((){
                      getLocation();
                    });
                  },
                ),
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

    print('getLocation.latitude: ${getLocation.latitude}');
    print("getLocation.longitude: ${getLocation.longitude}");
    print("getLocation.city: ${getLocation.city}");
    city = getLocation.city;
    getTemp(getLocation.latitude, getLocation.longitude);
  }

  // Get Temp
  Future<void> getTemp(double lat, double lon) async {
    String appId = '0769fb37917d0ed73656a2e17095965b';
    try {
      var uri = 'http://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${lon.toString()}&appid=$appId&units=metric';
      var url = Uri.parse(uri);
      http.Response response = await http.get(url);

      var dataDecoded = jsonDecode(response.body);
      description = dataDecoded["weather"][0]['description'];
      temp = dataDecoded["main"]['temp'];
      print('Temp: ${temp.toString()} C');
    } catch (e) {
      print(e);
    }
  }
}
