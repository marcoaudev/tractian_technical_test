import 'package:tractian_technical_test/features/domain/entities/company.dart';

class CompanyModel extends CompanyEntity {
  final String id;

  const CompanyModel({required this.id, required super.name});

  factory CompanyModel.fromJson(json) => CompanyModel(
        id: json['id'],
        name: json['name'],
      );
}
