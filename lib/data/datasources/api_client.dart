import 'package:flutter_clean_architecture_app/data/datasources/api.dart';
import 'package:flutter_clean_architecture_app/data/responses/api_response.dart';

class ApiClient implements Api {
  @override
  Future<ApiResponse> login({Map<String, dynamic>? parameters}) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
