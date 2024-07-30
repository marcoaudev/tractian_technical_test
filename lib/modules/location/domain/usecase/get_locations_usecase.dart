import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/core/usecase/usecase.dart';
import 'package:tractian_technical_test/modules/location/domain/entity/location.dart';
import 'package:tractian_technical_test/modules/location/domain/repository/location_repository_interface.dart';

class GetLocationUsecase implements Usecase<LocationEntity, NoParams> {  

  final ILocationRepository repository;

  GetLocationUsecase(this.repository);
  
  @override
  Future<Either<Failure, LocationEntity>> call(params) async{
    return await repository.getLocations();
  }
}
