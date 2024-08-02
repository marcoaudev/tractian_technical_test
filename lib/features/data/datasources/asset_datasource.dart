import 'package:tractian_technical_test/features/data/models/asset_model.dart';

abstract interface class IAssetDatasource{
  List<AssetModel> getAssetsFromLocationId({required String id});
  List<AssetModel> getAssetsFromAssetId({required String id});
}