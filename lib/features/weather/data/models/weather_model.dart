import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required String averageTemp,
    required String minTemperature,
    required String maxTemperature,
    required String description,
    required String date,
  }) : super(
          averageTemp: averageTemp,
          description: description,
          maxTemperature: maxTemperature,
          minTemperature: minTemperature,
          date: date,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      averageTemp: json['averageTemp'],
      description: json['description'],
      maxTemperature: json['maxTemperature'],
      minTemperature: json['minTemperature'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'minTemprature': minTemperature,
      'maxTemprature': minTemperature,
      'description': description,
    };
  }
}
