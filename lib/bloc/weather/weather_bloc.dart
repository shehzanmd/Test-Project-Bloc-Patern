import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../modal/weather_modal_class.dart';
import '../../repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async{
      if (event is FetchWeather) {
        emit(WeatherLoading());
        try {
           final Weather temperature = await WeatherRepository.getTemperature(event.cityName);

           print("*****************${temperature.main?.temp}*******************");

          final double temperature2 =  kelvinToCelsius(temperature.main?.temp);

          emit(WeatherLoaded(event.cityName, temperature2));

        print("*****************$temperature2*******************");
        } catch (e) {
          print("###################################: $e");
          emit(WeatherError('Failed to fetch weather data'));
        }
      }
    });
  }

  double kelvinToCelsius(double? kelvin) {
    return kelvin! - 273.15;
  }

}