import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';

abstract interface class ILocationRepository{
  Either<Failure, List<LocationEntity>> getLocations({required String nameCompany});
  Either<Failure, List<LocationEntity>> getLocationsFromId({required String id});
}