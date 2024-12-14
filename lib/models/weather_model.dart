class WeatherModel {
  final String cityName, weatherStatus;
  final DateTime date;
  final String? image;
  final double temp, minTemp, maxTemp;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStatus});

  // ignore: non_constant_identifier_names
  factory WeatherModel.fromJson(Json) {
    return WeatherModel(
        cityName: Json['location']['name'],
        date: DateTime.parse(Json['current']['last_updated']),
        temp: Json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: Json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: Json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weatherStatus: Json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: Json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
