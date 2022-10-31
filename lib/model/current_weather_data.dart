import 'package:weather_application/model/sys.dart';
import 'package:weather_application/model/weather.dart';
import 'package:weather_application/model/wind.dart';
import 'clouds.dart';
import 'coord.dart';
import 'main_weather.dart';

// الكلاس دة معمول عشان تاخد منه الداتا اللي انت عايزها في صفحة ال 
// HomePage

class CurrentWeatherData {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final MainWeather? mainWeather;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeatherData(
      {this.coord,
      this.weather,
      this.base,
      this.mainWeather,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory CurrentWeatherData.fromJson(dynamic json) {
    if (json == null) {
      return CurrentWeatherData();
    }

    return CurrentWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
              .map((w) => Weather.fromJson(w))
              .toList(),
      base: json['base'],
      mainWeather: MainWeather.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
