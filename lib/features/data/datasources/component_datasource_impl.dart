import 'package:tractian_technical_test/features/data/datasources/component_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/apex_unit.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/jaguar_unit.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/tobias_unit.dart';
import 'package:tractian_technical_test/features/data/models/component_model.dart';

class ComponentDatasourceImpl implements IComponentDatasource{

  List components = [];
  @override
  List<ComponentModel> getComponentsFromAssetId({required String id}) {
    
      components = Tobias.assets.where((component) => component['parentId'] != null && component['sensorType'] != null && component['parentId'].contains(id)).toList();
      components = Apex.assets.where((component) => component['parentId'] != null && component['sensorType'] != null && component['parentId'].contains(id)).toList();
      components = Jaguar.assets.where((component) => component['parentId'] != null && component['sensorType'] != null && component['parentId'].contains(id)).toList();
    return components.map((json) => ComponentModel.fromJson(json)).toList();
  }

  @override
  List<ComponentModel> getComponentsFromSensorType({required String sensorType}) {
    components.where((component) => component['parentId'] != null && component['sensorType'] != null && component['sensorType'].contains(sensorType)).toList();
    return components.map((json) => ComponentModel.fromJson(json)).toList();
  }

}