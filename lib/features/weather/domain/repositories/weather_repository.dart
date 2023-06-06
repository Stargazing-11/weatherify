import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, List<Weather>>> getWeather(String city);
}
