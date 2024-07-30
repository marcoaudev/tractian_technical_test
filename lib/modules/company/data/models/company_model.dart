import 'package:tractian_technical_test/modules/company/features/domain/entity/company.dart';

class CompanyModel extends CompanyEntity{
  final int id;

  const CompanyModel({required this.id,required super.name});

   factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      CompanyModel(
        id: json['id'],
        name: json['name']
      );
}