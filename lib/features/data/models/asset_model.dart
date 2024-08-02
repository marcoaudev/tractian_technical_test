import 'package:tractian_technical_test/features/domain/entities/asset.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.name,
    required super.id,
    required super.locationId,
    required super.parentId,
    required super.sensorType,
    required super.status,
  });

  factory AssetModel.fromJson(json) => AssetModel(
        id: json['id'],
        name: json['name'],
        locationId: json['locationId'],
        parentId: json['parentId'],
        sensorType: json['sensorType'],
        status: json['status'],
      );
}
