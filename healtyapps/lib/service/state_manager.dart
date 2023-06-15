import 'package:healtyapps/models/weather_model.dart';
import 'package:healtyapps/service/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final airData = FutureProvider<WeatherModel>((ref) async => panggilCuaca());
