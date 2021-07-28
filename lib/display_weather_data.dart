import 'package:flutter/material.dart';
import 'http_handler.dart';
import 'weather_data.dart';
import 'get_icon.dart';

// ignore: must_be_immutable
class DisplayWeatherData extends StatelessWidget {
  Future<WeatherData>? _getWeatherData;

  @override
  Widget build(BuildContext context) {
    _getWeatherData = HttpHandler.getHttpData();
    return FutureBuilder<WeatherData>(
      future: _getWeatherData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
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
                        "${snapshot.data!.city}",
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
                  leading: GetIcon.getIcon('${snapshot.data!.icon}'),
                  title: Text(
                    'Temperature: ${snapshot.data!.temp} C',
                  ),
                  subtitle: Text(
                    'Status: ${snapshot.data!.description}',
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Display Weather Data ${snapshot.hasError}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
