import 'package:dio/dio.dart';
import 'package:fudex_test/core/api/api_consumer.dart';
import 'package:fudex_test/core/api/app_interceptor.dart';
import 'package:fudex_test/core/api/dio_consumer.dart';
import 'package:fudex_test/features/addon/addon_container.dart';
import 'package:fudex_test/features/category/category_container.dart';
import 'package:fudex_test/features/keyword/keyword_container.dart';
import 'package:fudex_test/features/product/products_container.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  setupProductContainer();
  setupAddonContainer();
  setupCategoryContainer();
  setupKeywordContainer();

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
}
