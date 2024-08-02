import 'package:tractian_technical_test/features/domain/entities/asset.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_assets_from_asset_id_usecase.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_assets_from_id_usecase.dart';

class AssetsStore {
  final GetAssetFromLocationIdUsecase getAssetFromIdUsecase;
  final GetAssetFromAssetIdUsecase getAssetFromAssetIdUsecase;

  AssetsStore(this.getAssetFromIdUsecase, this.getAssetFromAssetIdUsecase);

  List<AssetEntity> fetchAssetsFromId({required String id}){
  
    final result = getAssetFromIdUsecase(id);
    List<AssetEntity> assets = [];

    result.fold(
      (_) {},
      (r) {
        assets = r;
        return assets;
      },
    );

    return assets;
  }

  List<AssetEntity> fetchAssetsFromAssetId({required String id}){
  
    final result = getAssetFromAssetIdUsecase(id);
    List<AssetEntity> assets = [];

    result.fold(
      (_) {},
      (r) {
        assets = r;
        return assets;
      },
    );

    return assets;
  }
}
