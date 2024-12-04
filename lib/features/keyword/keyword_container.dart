import 'package:fudex_test/features/keyword/data/data_source/keyword_remote_data_source.dart';
import 'package:fudex_test/features/keyword/data/repositories/keyword_repository_impl.dart';
import 'package:fudex_test/features/keyword/domain/repositories/keyword_repository.dart';
import 'package:fudex_test/features/keyword/domain/usecases/get_keywords_by_category_id_use_case.dart';
import 'package:fudex_test/features/keyword/presentation/cubits/get_keywords_by_category_id_cubit.dart';
import 'package:fudex_test/injection_container.dart';

void setupKeywordContainer() {
  sl.registerLazySingleton<GetKeywordsByCategoryIdCubit>(
    () => GetKeywordsByCategoryIdCubit(useCase: sl()),
  );

  sl.registerLazySingleton<GetKeywordsByCategoryIdUseCase>(
    () => GetKeywordsByCategoryIdUseCase(repository: sl()),
  );

  sl.registerLazySingleton<KeywordRepository>(
    () => KeywordRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<KeywordRemoteDataSource>(
    () => KeywordRemoteDataSourceImpl(),
  );
}
