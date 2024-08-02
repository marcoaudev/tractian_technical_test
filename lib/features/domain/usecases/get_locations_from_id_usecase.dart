import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/domain/repositories/location_repository_interface.dart';

class GetLocationFromIdUsecase{  

  final ILocationRepository repository;

  GetLocationFromIdUsecase(this.repository);

  Either<Failure, List<LocationEntity>> call(String id) {
    return repository.getLocationsFromId(id: id);
  }
}
