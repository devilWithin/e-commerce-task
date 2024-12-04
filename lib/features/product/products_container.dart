import 'package:fudex_test/features/category/presentation/cubits/get_addons_from_sub_category_cubit.dart';
import 'package:fudex_test/features/category/presentation/cubits/select_addons_cubit.dart';
import 'package:fudex_test/features/product/data/data_source/product_remote_data_source.dart';
import 'package:fudex_test/features/product/data/repositories/product_repository_impl.dart';
import 'package:fudex_test/features/product/domain/repositories/product_repository.dart';
import 'package:fudex_test/features/product/domain/use_cases/add_product_use_case.dart';
import 'package:fudex_test/features/product/domain/use_cases/edit_product_use_case.dart';
import 'package:fudex_test/features/product/domain/use_cases/get_all_products_use_case.dart';
import 'package:fudex_test/features/product/presentation/cubit/add_product_cubit.dart';
import 'package:fudex_test/features/product/presentation/cubit/edit_product_cubit.dart';
import 'package:fudex_test/features/product/presentation/cubit/get_all_products_cubit.dart';
import 'package:fudex_test/injection_container.dart';

void setupProductContainer() {
  //cubits
  sl.registerLazySingleton<AddProductCubit>(
      () => AddProductCubit(useCase: sl()));

  sl.registerLazySingleton<EditProductCubit>(
      () => EditProductCubit(useCase: sl()));

  sl.registerLazySingleton<GetAllProductsCubit>(
      () => GetAllProductsCubit(useCase: sl()));

  sl.registerLazySingleton<SelectAddonsCubit>(() => SelectAddonsCubit());
  sl.registerLazySingleton<GetAddonsFromSubCategoryCubit>(
      () => GetAddonsFromSubCategoryCubit());

  //use cases
  sl.registerLazySingleton<AddProductUseCase>(
      () => AddProductUseCase(repository: sl()));

  sl.registerLazySingleton<EditProductUseCase>(
      () => EditProductUseCase(repository: sl()));

  sl.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(repository: sl()));

  //repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));

  //data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiConsumer: sl()));
}
