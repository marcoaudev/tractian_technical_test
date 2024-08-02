import 'package:tractian_technical_test/features/data/models/component_model.dart';

abstract interface class IComponentDatasource{
  List<ComponentModel> getComponentsFromAssetId({required String id});
  List<ComponentModel> getComponentsFromSensorType({required String sensorType});
}