import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/component.dart';

abstract interface class IComponentRepository{
  Either<Failure, List<ComponentEntity>> getComponentsFromAssetId({required String id});
  Either<Failure, List<ComponentEntity>> getComponentsFromSensorType({required String sensorType});
}