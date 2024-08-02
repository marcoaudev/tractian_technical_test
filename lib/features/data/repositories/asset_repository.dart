import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/data/datasources/asset_datasource.dart';
import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/domain/repositories/asset_repository_interface.dart';

class AssetRepositoryImpl implements IAssetRepository{

  final IAssetDatasource datasource;

  AssetRepositoryImpl(this.datasource);
  
  @override
  Either<Failure, List<AssetEntity>> getAssetsFromLocationId({required String id}) {
    try{
      final result = datasource.getAssetsFromLocationId(id: id);
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, List<AssetEntity>> getAssetsFromAssetId({required String id}) {
    try{
      final result = datasource.getAssetsFromAssetId(id: id);
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }
  

}