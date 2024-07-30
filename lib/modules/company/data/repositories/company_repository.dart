import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/modules/company/domain/repository/company_repository_interface.dart';
import 'package:tractian_technical_test/modules/company/features/domain/entity/company.dart';

class CompanyRepositoryImpl implements ICompanyRepository{
  @override
  Future<Either<Failure, CompanyEntity>> getCompanies() {
    // TODO: implement getCompanies
    throw UnimplementedError();
  }

}