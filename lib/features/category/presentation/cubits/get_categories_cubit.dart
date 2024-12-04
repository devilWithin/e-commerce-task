import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/domain/use_cases/get_categories_use_case.dart';

class GetCategoriesCubit extends Cubit<BaseState<List<Category>>> {
  final GetCategoriesUseCase _useCase;

  GetCategoriesCubit({required GetCategoriesUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> getCategories() async {
    emit(state.setInProgressState());
    final result = await _useCase(NoParams());
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (item) => emit(state.setSuccessState(item)),
    );
  }
}
