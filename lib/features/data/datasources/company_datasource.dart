import 'package:tractian_technical_test/features/data/models/company_model.dart';

abstract interface class ICompanyDatasource{
  Future<List<CompanyModel>> getCompany();
}