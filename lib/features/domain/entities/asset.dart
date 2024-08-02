import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable {
  final String name;
  final String id;
  final String? locationId;
  final String? parentId;
  final String? sensorType;
  final String? status;

  const AssetEntity({
    required this.name,
    required this.id,
    required this.locationId,
    required this.parentId,
    required this.sensorType,
    required this.status,
  });
  
  @override
  List<Object?> get props => [name, id, locationId, parentId, sensorType, status];
}
