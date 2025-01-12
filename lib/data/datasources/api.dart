import 'package:flutter_clean_architecture_app/data/responses/api_response.dart';

abstract class Api {
  Future<ApiResponse> login({Map<String, dynamic>? parameters});
}
