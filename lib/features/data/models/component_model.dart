import 'package:tractian_technical_test/features/domain/entities/component.dart';

class ComponentModel extends ComponentEntity {
  const ComponentModel({
    required super.name,
    required super.id,
    required super.locationId,
    required super.parentId,
    required super.sensorType,
    required super.status,
  });

  factory ComponentModel.fromJson(json) => ComponentModel(
        id: json['id'],
        name: json['name'],
        locationId: json['locationId'],
        parentId: json['parentId'],
        sensorType: json['sensorType'],
        status: json['status'],
      );
}
