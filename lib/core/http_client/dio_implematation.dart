import 'package:dio/dio.dart';
import 'package:tractian_technical_test/core/http_client/http_client.dart';

class DioImplematation implements IHttpClient{

  final dio = Dio();
  
  @override
  Future<HttpResponse> get(String url) async{
    final response = await dio.get(url);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
}