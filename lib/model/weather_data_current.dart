class WeatherDataCurrent {
  final Main weatherCurrent;
  WeatherDataCurrent({required this.weatherCurrent});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(weatherCurrent: Main.fromJson(json));
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? clouds;
  Wind? wind;
  List<Weather>? weather;
  String? name;
  int? dt;
  int? timezone;
  Sys? sys;
  double? uvIndex;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.clouds,
    this.wind,
    this.weather,
    this.name,
    this.dt,
    this.timezone,
    this.sys,
    this.uvIndex,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json['main']['temp'] as num?)?.toDouble(),
        feelsLike: (json['main']['feels_like'] as num?)?.toDouble(),
        tempMin: (json['main']['temp_min'] as num?)?.toDouble(),
        tempMax: (json['main']['temp_max'] as num?)?.toDouble(),
        pressure: json['main']['pressure'] as int?,
        humidity: json['main']['humidity'] as int?,
        wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
        clouds: json['clouds']['all'] as int?,
        name: json['name'] as String?,
        dt: json['dt'] as int?,
        timezone: json['timezone'] as int?,
        uvIndex: (json['main']['uvIndex'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds,
        'wind': wind?.toJson(),
        'name': name,
        'dt': dt,
        'timezone': timezone,
        'sys': sys,
      };
}

class Clouds {
  int? all;
  Clouds({this.all});
  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(all: json['all'] as int?);
  Map<String, dynamic> toJson() => {'all': all};
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: (json['speed'] as num?)?.toDouble(),
        deg: json['deg'] as int?,
        gust: (json['gust'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  // from json
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] as int?,
        id: json['id'] as int?,
        country: json['country'] as String?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}
