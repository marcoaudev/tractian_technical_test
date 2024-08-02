import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/data/datasources/component_datasource.dart';
import 'package:tractian_technical_test/features/domain/entities/component.dart';
import 'package:tractian_technical_test/features/domain/repositories/component_repository.dart';

class ComponentRepositoryImpl implements IComponentRepository{

  final IComponentDatasource datasource;

  ComponentRepositoryImpl(this.datasource);

  @override
  Either<Failure, List<ComponentEntity>> getComponentsFromAssetId({required String id}) {
    try{
      final result = datasource.getComponentsFromAssetId(id: id);
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, List<ComponentEntity>> getComponentsFromSensorType({required String sensorType}) {
    try{
      final result = datasource.getComponentsFromSensorType(sensorType: sensorType);
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }
  
}