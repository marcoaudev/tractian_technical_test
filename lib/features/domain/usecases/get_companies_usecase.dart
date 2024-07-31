import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/core/usecase/usecase.dart';
import 'package:tractian_technical_test/features/domain/entities/company.dart';
import 'package:tractian_technical_test/features/domain/repositories/company_repository_interface.dart';

class GetCompanyUsecase implements Usecase<List<CompanyEntity>, NoParams> {  

  final ICompanyRepository repository;

  GetCompanyUsecase(this.repository);
  
  @override
  Future<Either<Failure, List<CompanyEntity>>> call() async{
    return await repository.getCompanies();
  }
}
