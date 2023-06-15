import 'dart:convert';

import 'package:healtyapps/models/weather_model.dart';
import 'package:healtyapps/utils/enivorement.dart';
import 'package:http/http.dart' as http;

// String _lokasi = 'Jakarta';
// lokasi(String lokasi) {
//   _lokasi = lokasi;
// }

Future<WeatherModel> panggilCuaca() async {
  try {
    final url = Uri.parse(
        'https://api.airvisual.com/v2/city?city=Jakarta&state=Jakarta&country=Indonesia&key=cea6271e-1b96-457a-b81b-b3927d6db6d6');
    final response = await http.get(url);
    var res = json.decode(response.body);
    return WeatherModel.fromJson(res);
  } catch (e) {
    rethrow;
  }
}
