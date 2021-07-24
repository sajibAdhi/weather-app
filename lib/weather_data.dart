class WeatherData {
  final String city;
  final String description;
  final String temp;

  WeatherData({this.city, this.description, this.temp});

  factory WeatherData.fromJSON(Map<String, dynamic> json) {
    return WeatherData(
      city: json['name'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp']
    );
  }
}
