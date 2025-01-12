import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_app/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_app/core/error/feature.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/data/datasources/api_client.dart';
import 'package:flutter_clean_architecture_app/data/responses/api_response.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository(this.apiClient);

  Future<Either<Feature, ApiResponse>> login(
      {Map<String, dynamic>? parameters}) async {
    try {
      final response = await apiClient.login(parameters: parameters);
      if (response.status != ApiStatus.success.name) {
        return Left(GeneralException(response.message));
      }
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerException(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkException(e.message));
    } catch (e) {
      return Left(GeneralException(e.toString()));
    }
  }
}
