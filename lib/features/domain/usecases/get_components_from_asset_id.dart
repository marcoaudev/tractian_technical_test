import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/component.dart';
import 'package:tractian_technical_test/features/domain/repositories/component_repository.dart';

class GetComponentsFromAssetIdUsecase{  

  final IComponentRepository repository;

  GetComponentsFromAssetIdUsecase(this.repository);
  
  Either<Failure, List<ComponentEntity>> call(id) {
    return repository.getComponentsFromAssetId(id: id);
  }
}
