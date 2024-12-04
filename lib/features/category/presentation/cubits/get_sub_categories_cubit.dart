import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/domain/use_cases/get_sub_categories_use_case.dart';

class GetSubCategoriesCubit extends Cubit<BaseState<List<Category>>> {
  final GetSubCategoriesUseCase _useCase;

  GetSubCategoriesCubit({required GetSubCategoriesUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> getSubCategories({required int categoryId}) async {
    emit(state.setInProgressState());
    final result = await _useCase(categoryId);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (item) => emit(state.setSuccessState(item)),
    );
  }
}
