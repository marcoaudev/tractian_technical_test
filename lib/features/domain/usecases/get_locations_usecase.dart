import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/domain/repositories/location_repository_interface.dart';

class GetLocationUsecase{  

  final ILocationRepository repository;

  GetLocationUsecase(this.repository);
  
  Either<Failure, List<LocationEntity>> call(String name) {
    return repository.getLocations(nameCompany: name);
  }
}
