import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? weatherCurrent;
  final WeatherDataDaily? weatherDaily;
  final WeatherDataHourly? weatherHourly;
  WeatherData([this.weatherCurrent, this.weatherDaily, this.weatherHourly]);

  WeatherDataCurrent getCurrentWeather() => weatherCurrent!;
  WeatherDataDaily getDailyWeather() => weatherDaily!;
  WeatherDataHourly getHourlyWeather() => weatherHourly!;
}
