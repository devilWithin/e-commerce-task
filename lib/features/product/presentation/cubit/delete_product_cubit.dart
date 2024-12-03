import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/product/domain/use_cases/delete_product_use_case.dart';

class DeleteProductCubit extends Cubit<BaseState<Unit>> {
  final DeleteProductUseCase _useCase;

  DeleteProductCubit({required DeleteProductUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> deleteProduct(String productId) async {
    emit(state.setInProgressState());
    final result = await _useCase(productId);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (unit) => emit(state.setSuccessState(unit)),
    );
  }
}
