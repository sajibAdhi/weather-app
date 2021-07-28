class WeatherData {
  final String city;
  final String description;
  final double temp;
  final String icon;

  WeatherData(
      {required this.city,
      required this.description,
      required this.icon,
      required this.temp});

  factory WeatherData.fromJSON(Map<String, dynamic> json) {
    return new WeatherData(
        city: json['name'],
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon'],
        temp: json['main']['temp']);
  }
}
