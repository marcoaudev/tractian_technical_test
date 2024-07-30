import 'package:dartz/dartz.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/core/usecase/usecase.dart';
import 'package:tractian_technical_test/modules/company/domain/repository/company_repository_interface.dart';
import 'package:tractian_technical_test/modules/company/features/domain/entity/company.dart';

class GetCompanyUsecase implements Usecase<CompanyEntity, NoParams> {  

  final ICompanyRepository repository;

  GetCompanyUsecase(this.repository);
  
  @override
  Future<Either<Failure, CompanyEntity>> call(params) async{
    return await repository.getCompanies();
  }
}
