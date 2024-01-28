import 'package:weather_app/model/weather_api.dart';

class WeatherDataV2 {
  final Weatherapi? weather;

  WeatherDataV2([this.weather]);

  Weatherapi getWeather() => weather!;
}
