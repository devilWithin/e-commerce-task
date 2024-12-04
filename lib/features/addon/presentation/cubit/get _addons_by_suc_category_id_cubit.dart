import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/addon/domain/entities/addon.dart';
import 'package:fudex_test/features/addon/domain/usecases/get_addons_by_sub_category_id_use_case.dart';

class GetAddonsBySubCategoryIdCubit extends Cubit<BaseState<List<Addon>>> {
  final GetAddonsBySubCategoryIdUseCase _useCase;

  GetAddonsBySubCategoryIdCubit(
      {required GetAddonsBySubCategoryIdUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> getAddonsBySubCategoryId({required int subCategoryId}) async {
    emit(state.setInProgressState());
    final result = await _useCase(subCategoryId);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (data) => emit(state.setSuccessState(data)),
    );
  }
}
