import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/modules/location/domain/entity/location.dart';
import 'package:tractian_technical_test/modules/location/domain/repository/location_repository_interface.dart';

class LocationRepositoryImpl implements ILocationRepository{
  @override
  Future<Either<Failure, LocationEntity>> getLocations() {
    // TODO: implement getCompanies
    throw UnimplementedError();
  }

}