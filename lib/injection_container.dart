import 'package:dio/dio.dart';
import 'package:fudex_test/core/api/api_consumer.dart';
import 'package:fudex_test/core/api/app_interceptor.dart';
import 'package:fudex_test/core/api/dio_consumer.dart';
import 'package:fudex_test/features/product/auth_container.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  setupProductContainer();

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
}
