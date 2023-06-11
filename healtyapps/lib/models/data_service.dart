import 'dart:convert';

import 'package:healtyapps/models/weather.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<Weather> fetchData(String cityName) async {
    try {
      //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
      final queryParameters = {
        'q': cityName,
        'appid': '3b386a4b7c537acd4690199cecbca5ec',
        'units': 'imperial'
      };
      final uri = Uri.https("api.openweathermap.org", '/data/2.5/weather', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('failed to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
