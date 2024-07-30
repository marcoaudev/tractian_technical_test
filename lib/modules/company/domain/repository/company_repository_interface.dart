import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/modules/company/features/domain/entity/company.dart';

abstract interface class ICompanyRepository{
  Future<Either<Failure, CompanyEntity>> getCompanies();
}