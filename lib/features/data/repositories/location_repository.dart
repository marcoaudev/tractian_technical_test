import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/data/datasources/location_datasource.dart';
import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/domain/repositories/location_repository_interface.dart';

class LocationRepositoryImpl implements ILocationRepository{

  final ILocationDatasource datasource;

  LocationRepositoryImpl(this.datasource);
  
  @override
  Either<Failure, List<LocationEntity>> getLocations({required String nameCompany}){
    try{
      final result = datasource.getLocations(nameCompany: nameCompany);
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }
  
  @override
  Either<Failure, List<LocationEntity>> getLocationsFromId({required String id}){
     try{
      final result = datasource.getLocationsFromId(id: id);
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }
}