import 'package:tractian_technical_test/core/http_client/http_client.dart';
import 'package:tractian_technical_test/features/data/datasources/asset_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/apex_unit.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/jaguar_unit.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/tobias_unit.dart';
import 'package:tractian_technical_test/features/data/models/asset_model.dart';

class AssetDatasourceImpl implements IAssetDatasource{

  final IHttpClient client;
  
  AssetDatasourceImpl(this.client);

  @override
  List<AssetModel> getAssetsFromLocationId({required String id}) {
    List assets = [];
    assets = Tobias.assets.where((asset) => asset['locationId']  != null && asset['sensorType'] == null &&  asset['locationId'].contains(id)).toList();
    assets = Apex.assets.where((asset) => asset['locationId']  != null && asset['sensorType'] == null &&  asset['locationId'].contains(id)).toList();
    assets = Jaguar.assets.where((asset) => asset['locationId']  != null && asset['sensorType'] == null &&  asset['locationId'].contains(id)).toList();
    return assets.map((json) => AssetModel.fromJson(json)).toList();
  }
  
  @override
  List<AssetModel> getAssetsFromAssetId({required String id}) {
    List assets = [];
    assets = Tobias.assets.where((asset) => asset['parentId'] != null && asset['sensorType'] == null && asset['parentId'].contains(id)).toList();
    assets = Apex.assets.where((asset) => asset['parentId'] != null && asset['sensorType'] == null && asset['parentId'].contains(id)).toList();
    assets = Jaguar.assets.where((asset) => asset['parentId'] != null && asset['sensorType'] == null && asset['parentId'].contains(id)).toList();
    return assets.map((json) => AssetModel.fromJson(json)).toList();
  }
}