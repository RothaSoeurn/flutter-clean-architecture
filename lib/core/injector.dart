import 'package:flutter_clean_architecture_app/data/datasources/api_client.dart';
import 'package:flutter_clean_architecture_app/data/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
