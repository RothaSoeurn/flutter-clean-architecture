import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_architecture_app/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_app/data/datasources/api.dart';
import 'package:flutter_clean_architecture_app/data/datasources/api_route.dart';
import 'package:flutter_clean_architecture_app/data/responses/api_response.dart';
import 'package:http/http.dart' as http;

class ApiClient implements Api {
  Future<Map<String, dynamic>> postRequest(String endpoint) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiRouter.baseUrl}$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw ServerException('Server returned a non-200 status code');
      }
      return json.decode(response.body);
    } catch (e) {
      if (e is SocketException) {
        throw NetworkException('Failed to connect to the server');
      } else {
        throw ServerException('An error occurred: $e');
      }
    }
  }

  @override
  Future<ApiResponse> login({Map<String, dynamic>? parameters}) async {
    final jsonResponse = await postRequest(ApiRouter.login);
    return ApiResponse(
      status: jsonResponse['status'],
      record: jsonResponse['record'],
    );
  }
}
