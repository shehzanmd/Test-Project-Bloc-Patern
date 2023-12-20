import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/weather_modal_class.dart';

class WeatherRepository {
   static Future<Weather> getTemperature(String cityName) async {
    const apiKey="c5e70355f9b93ad19d5028bae25ce709";
    final url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey");
    try{
      print("************************* API CALL STARTED *****************************");
      print("$url");
      final response = await http.get(url);
      if (response.statusCode == 200) {

        print("*********Response******** ${response.body} *******************");

        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }

    }catch(_){
      throw Exception();
    }
  }
}