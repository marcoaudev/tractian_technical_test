import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';

abstract interface class ILocationRepository{
  Future<Either<Failure, LocationEntity>> getLocations();
}