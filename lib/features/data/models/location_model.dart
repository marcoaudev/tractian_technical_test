import 'package:tractian_technical_test/features/domain/entities/location.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.id,
    required super.name,
    required super.parentId,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json['id'],
        name: json['name'],
        parentId: json['parentId'],
      );
}
