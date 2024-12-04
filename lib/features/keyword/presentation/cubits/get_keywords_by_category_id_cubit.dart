import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/keyword/domain/entities/keyword.dart';
import 'package:fudex_test/features/keyword/domain/usecases/get_keywords_by_category_id_use_case.dart';

class GetKeywordsByCategoryIdCubit extends Cubit<BaseState<List<Keyword>>> {
  final GetKeywordsByCategoryIdUseCase _useCase;

  GetKeywordsByCategoryIdCubit(
      {required GetKeywordsByCategoryIdUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> getKeywordsByCategoryId(int categoryId) async {
    emit(state.setInProgressState());
    final result = await _useCase(categoryId);
    result.fold(
      (error) => emit(state.setFailureState(error)),
      (keywords) => emit(state.setSuccessState(keywords)),
    );
  }
}
