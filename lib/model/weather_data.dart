import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';

class WeatherData {
  final WeatherDataCurrent? weatherCurrent;
  final WeatherDataDaily? weatherDaily;
  WeatherData([this.weatherCurrent, this.weatherDaily]);
  WeatherDataCurrent getCurrentWeather() => weatherCurrent!;
  WeatherDataDaily getDailyWeather() => weatherDaily!;
}
