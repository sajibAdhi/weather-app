class WeatherData {
  final String city;
  final String description;
  final int temp;

  WeatherData({required this.city, required this.description, required this.temp});

  factory WeatherData.fromJSON(Map<String, dynamic> json) {
    return WeatherData(
        city: json['name'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp']);
  }
}
