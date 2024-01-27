class WeatherDataDaily {
  List<Daily> daily;
  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
          daily: List<Daily>.from(json['list'].map((e) => Daily.fromJson(e))));
}

class Daily {
  int? dt;
  String? dtTxt;
  Main? main;
  int? clouds;
  List<Weather>? weather;
  Wind? wind;

  Daily({
    this.dt,
    this.dtTxt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json['dt'] as int?,
        dtTxt: json['dt_txt'] as String?,
        // Because 'clouds' only has 1 field 'all' so we can get it directly
        clouds: json['clouds']['all'] as int?,
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'dtTxt': dtTxt,
        'main': main?.toJson(),
        'wind': wind?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;
  double? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json['temp'] as num?)?.toDouble(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        tempMin: (json['temp_min'] as num?)?.toDouble(),
        tempMax: (json['temp_max'] as num?)?.toDouble(),
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
        seaLevel: json['sea_level'] as int?,
        grndLevel: json['grnd_level'] as int?,
        tempKf: (json['temp_kf'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'humidity': humidity,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
        'temp_kf': tempKf,
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

class Clouds {
  int? all;
  Clouds({this.all});
  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(all: json['all'] as int?);
  Map<String, dynamic> toJson() => {'all': all};
}
