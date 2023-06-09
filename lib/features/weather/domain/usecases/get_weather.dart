import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository repository;
  GetWeather({required this.repository});

  Future<Either<Failure, List<Weather>>> call(String cityName) async {
    return await repository.getWeather(cityName);
  }
}
