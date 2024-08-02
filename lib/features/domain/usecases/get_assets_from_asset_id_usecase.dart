import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/domain/repositories/asset_repository_interface.dart';

class GetAssetFromAssetIdUsecase{
  final IAssetRepository repository;

  GetAssetFromAssetIdUsecase(this.repository);

  Either<Failure, List<AssetEntity>> call(id) {
    return repository.getAssetsFromAssetId(id: id);
  }
}
