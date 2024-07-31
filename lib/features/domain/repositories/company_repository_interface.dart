import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/domain/entities/company.dart';

abstract interface class ICompanyRepository{
  Future<Either<Failure, List<CompanyEntity>>> getCompanies();
}