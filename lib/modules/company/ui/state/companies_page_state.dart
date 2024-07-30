import 'package:tractian_technical_test/modules/company/data/models/company_model.dart';

abstract class CompaniesPageState{}

class InitialCompaniesPageState extends CompaniesPageState{}
class LoadingCompaniesPageState extends CompaniesPageState{}
class SuccessCompaniesPageState extends CompaniesPageState{
  List<CompanyModel> companies;

  SuccessCompaniesPageState({required this.companies});
}
class ErrorCompaniesPageState extends CompaniesPageState{
  final String message;

  ErrorCompaniesPageState({required this.message});
}
