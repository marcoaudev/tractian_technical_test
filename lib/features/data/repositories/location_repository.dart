import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/domain/repositories/location_repository_interface.dart';

class LocationRepositoryImpl implements ILocationRepository{
  @override
  Future<Either<Failure, LocationEntity>> getLocations() {
    // TODO: implement getCompanies
    throw UnimplementedError();
  }

}