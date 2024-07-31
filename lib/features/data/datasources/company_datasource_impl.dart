import 'package:tractian_technical_test/features/data/datasources/endpoints/tractian_endpoints.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';
import 'package:tractian_technical_test/core/http_client/http_client.dart';
import 'package:tractian_technical_test/features/data/datasources/company_datasource.dart';
import 'package:tractian_technical_test/features/data/models/company_model.dart';

class CompanyDatasourceImpl implements ICompanyDatasource{

  final IHttpClient client;

  CompanyDatasourceImpl(this.client);

  @override
  Future<List<CompanyModel>> getCompany() async{
    final response = await client.get(TractianEndpoints.get('/companies'));
    if(response.statusCode == 200){
      final List companies = response.data;
      return companies.map((json) => CompanyModel.fromJson(json)).toList();
    }else{
      throw ServerFailure();
    }
  }
}