import 'package:tractian_technical_test/features/domain/entities/company.dart';

abstract class HomePageState{}

class InitialHomePageState extends HomePageState{}
class LoadingHomePageState extends HomePageState{}
class SuccessHomePageState extends HomePageState{
  List<CompanyEntity> companies;

  SuccessHomePageState({required this.companies});
}
class ErrorHomePageState extends HomePageState{
  final String message;

  ErrorHomePageState({required this.message});
}
