import 'package:fudex_test/features/addon/data/data_source/addon_remote_data_source.dart';
import 'package:fudex_test/features/addon/data/repositories/addon_repository_impl.dart';
import 'package:fudex_test/features/addon/domain/repositories/addon_repository.dart';
import 'package:fudex_test/features/addon/domain/usecases/get_addons_by_sub_category_id_use_case.dart';
import 'package:fudex_test/features/addon/presentation/cubit/get%20_addons_by_suc_category_id_cubit.dart';
import 'package:fudex_test/injection_container.dart';

void setupAddonContainer() {
  sl.registerLazySingleton<GetAddonsBySubCategoryIdCubit>(
    () => GetAddonsBySubCategoryIdCubit(useCase: sl()),
  );

  sl.registerLazySingleton<GetAddonsBySubCategoryIdUseCase>(
    () => GetAddonsBySubCategoryIdUseCase(repository: sl()),
  );

  sl.registerLazySingleton<AddonRepository>(
    () => AddonRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<AddonRemoteDataSource>(
    () => AddonRemoteDataSourceImpl(),
  );
}
