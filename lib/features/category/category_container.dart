import 'package:fudex_test/features/category/data/data_source/category_remote_data_source.dart';
import 'package:fudex_test/features/category/data/data_source/sub_category_remote_data_source.dart';
import 'package:fudex_test/features/category/data/repositories/category_repository_impl.dart';
import 'package:fudex_test/features/category/data/repositories/sub_category_repository_impl.dart';
import 'package:fudex_test/features/category/domain/repositories/category_repository.dart';
import 'package:fudex_test/features/category/domain/repositories/sub_category_repository.dart';
import 'package:fudex_test/features/category/domain/use_cases/get_categories_use_case.dart';
import 'package:fudex_test/features/category/domain/use_cases/get_sub_categories_use_case.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_categories_cubit.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_sub_categories_cubit.dart';
import 'package:fudex_test/injection_container.dart';

void setupCategoryContainer() {
  sl.registerLazySingleton<GetCategoriesCubit>(
    () => GetCategoriesCubit(useCase: sl()),
  );

  sl.registerLazySingleton<GetSubCategoriesCubit>(
    () => GetSubCategoriesCubit(useCase: sl()),
  );

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetSubCategoriesUseCase>(
    () => GetSubCategoriesUseCase(repository: sl()),
  );

  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<SubCategoryRepository>(
    () => SubCategoryRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<SubCategoryRemoteDataSource>(
    () => SubCategoryRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(),
  );
}
