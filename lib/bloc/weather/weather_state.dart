part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String cityName;
  final double temperature;

  WeatherLoaded(this.cityName, this.temperature);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}