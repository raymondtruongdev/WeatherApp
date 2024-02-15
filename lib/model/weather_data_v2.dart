import 'package:weather_app/model/weather_api.dart';

class WeatherDataV2 {
  final Weatherapi? weather;

  WeatherDataV2([this.weather]);

  Weatherapi getWeather() => weather!;
}

class WeatherApiData {
  final WeatherApiDataParser? data;
  late List<List<Hour>> hour;

  WeatherApiData([this.data]) {
    hour = [];
    data?.day?.forEach((element) {
      try {
        hour.add([...element.hour!]);
      } catch (e) {
        // print('can not convert');
      }
    });
  }
}
