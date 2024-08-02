import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/domain/repositories/asset_repository_interface.dart';

class GetAssetFromLocationIdUsecase{
  final IAssetRepository repository;

  GetAssetFromLocationIdUsecase(this.repository);

  Either<Failure, List<AssetEntity>> call(id) {
    return repository.getAssetsFromLocationId(id: id);
  }
}
