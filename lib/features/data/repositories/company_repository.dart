import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/features/data/datasources/company_datasource.dart';
import 'package:tractian_technical_test/features/domain/entities/company.dart';
import 'package:tractian_technical_test/features/domain/repositories/company_repository_interface.dart';

class CompanyRepositoryImpl implements ICompanyRepository{

  final ICompanyDatasource datasource;

  CompanyRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async{
    try{
      final result = await datasource.getCompany();
      return Right(result);
    }on Exception{
      return Left(ServerFailure());
    }
  }

}