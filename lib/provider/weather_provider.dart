import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/weather_model/weather_model.dart';
import 'package:weather/data/repos/weather_repo.dart';

final cityProvider = StateProvider<String>((ref) => "");
final weatherProvider = FutureProvider<WeatherModel>((ref) async {
  final repo = ref.read(repoProvider);
  final cityName = ref.watch(cityProvider);
  log("==============");
  return repo.findCity(cityName: cityName);
});
