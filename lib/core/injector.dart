import 'package:flutter_clean_architecture_app/core/services/database_service.dart';
import 'package:flutter_clean_architecture_app/core/services/secure_storage_service.dart';
import 'package:flutter_clean_architecture_app/core/services/shared_preference_service.dart';
import 'package:flutter_clean_architecture_app/data/datasources/api_client.dart';
import 'package:flutter_clean_architecture_app/data/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator
      .registerLazySingleton<DatabaseService>(() => DatabaseService.instance);
  locator.registerLazySingleton<SharedPreferenceService>(
      () => SharedPreferenceService.instance);

  locator.registerLazySingleton<SecureStorageService>(
      () => SecureStorageService());
}
