import 'dart:convert';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/errors/exceptions.dart';

abstract class WeatherRemoteDataSource {
  Future<List<WeatherModel>> getWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final uriString = '';

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<List<WeatherModel>> getWeather(String cityName) async {
    final response = await client.get(
        Uri.parse(
            'https://api.worldweatheronline.com/premium/v1/weather.ashx/?key=7d197f528a0548e085e123715232205&q=$cityName&format=JSON'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      List newJson = [];

      for (int i = 0; i < 5; i++) {
        Map temp = {
          "averageTemp": jsonResponse['data']['current_condition'][0]['temp_C'],
          "description": jsonResponse['data']['current_condition'][0]
              ['weatherDesc'],
          "minTemperature": jsonResponse['data']['weather'][i]['mintempC'],
          "maxTemperature": jsonResponse['data']['weather'][i]['maxtempC'],
          "date": jsonResponse['data']['weather'][i]['date'],
        };
        newJson.add(temp);
      }
      final weatherList = List<Map<String, dynamic>>.from(newJson);

      final weatherModels =
          weatherList.map((json) => WeatherModel.fromJson(json)).toList();
      return weatherModels;
    } else {
      throw ServerException('Internal Server Failure');
    }
  }
}
