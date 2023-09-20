import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/data/model/weather_model/weather_model.dart';

final repoProvider = Provider<WeatherRepo>((ref) => WeatherRepo());

class WeatherRepo {
  final dio = Dio();
  Future<WeatherModel> findCity({required String cityName}) async {
    final rse = await dio.get(
      "http://api.weatherapi.com/v1/forecast.json",
      queryParameters: {
        "key": "b742a838159c4737883215433231909",
        "days": 3,
        "q": cityName
      },
    );
    final data = rse.data as Map<String, dynamic>;
    return WeatherModel.fromJson(data);
  }
}
