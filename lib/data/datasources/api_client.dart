import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_clean_architecture_app/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_app/core/injector.dart';
import 'package:flutter_clean_architecture_app/core/services/secure_storage_service.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/key.dart';
import 'package:flutter_clean_architecture_app/data/datasources/api.dart';
import 'package:flutter_clean_architecture_app/data/datasources/api_route.dart';
import 'package:flutter_clean_architecture_app/data/responses/api_response.dart';
import 'package:http/http.dart' as http;

class ApiClient implements Api {
  Future<Map<String, dynamic>> postRequest(
    String endpoint,
    Map<String, dynamic>? paramters,
  ) async {
    try {
      if (endpoint.isEmpty) {
        throw GeneralException('Endpoint cannot be null or empty');
      }
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final secureStorageService = locator<SecureStorageService>();
      Map<String, dynamic> params = {
        'delice_info': deviceInfo.deviceInfo,
        'token': await secureStorageService.read(tokenKey),
      };
      if (paramters != null) {
        params.addAll(paramters);
      }

      final response = await http.post(
        Uri.parse('${ApiRouter.baseUrl}$endpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: params,
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
    final jsonResponse = await postRequest(ApiRouter.login, parameters);
    return ApiResponse(
      status: jsonResponse['status'],
      record: jsonResponse['record'],
    );
  }
}
