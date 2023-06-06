import 'package:dartz/dartz.dart';
import 'package:weatherify/core/errors/exceptions.dart';
import 'package:weatherify/features/weather/domain/entities/weather.dart';
import 'package:weatherify/core/errors/failures.dart';
import 'package:weatherify/features/weather/domain/repositories/weather_repository.dart';

import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, List<Weather>>> getWeather(String cityName) async {
    try {
      final remoteWeather = await remoteDataSource.getWeather(cityName);
      return Right(remoteWeather);
    } on ServerException {
      return Left(ServerFailure('Internal Server Failure'));
    }
  }
}
