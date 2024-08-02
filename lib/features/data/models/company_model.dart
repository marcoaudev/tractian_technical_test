import 'package:tractian_technical_test/features/domain/entities/company.dart';

class CompanyModel extends CompanyEntity {
  
  const CompanyModel({required super.id, required super.name});

  factory CompanyModel.fromJson(json) => CompanyModel(
        id: json['id'],
        name: json['name'],
      );
}
