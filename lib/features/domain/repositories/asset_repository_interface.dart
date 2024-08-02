import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';

abstract interface class IAssetRepository{
  Either<Failure, List<AssetEntity>> getAssetsFromLocationId({required String id});
  Either<Failure, List<AssetEntity>> getAssetsFromAssetId({required String id});
}