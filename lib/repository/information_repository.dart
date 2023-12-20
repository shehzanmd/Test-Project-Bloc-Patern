import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:m_test/modal/information_modal_class.dart';

class InfoRepository {
  static Future<Information> fetchRandomAPI() async {
    final url = Uri.parse("https://www.boredapi.com/api/activity");
    try {
      print("************************* API CALL STARTED *****************************");
      print("$url");
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Information.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }
}
