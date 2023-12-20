class Weather {
  WeatherMain? main;

  Weather({
    this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    main: json["main"] == null ? null : WeatherMain.fromJson(json["main"]),
  );

  Map<String, dynamic> toJson() => {
    "main": main?.toJson(),
  };
}


class WeatherMain {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  WeatherMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json) => WeatherMain(
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
  };
}



