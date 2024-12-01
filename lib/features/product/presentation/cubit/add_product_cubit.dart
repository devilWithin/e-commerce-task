import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/domain/use_cases/add_product_use_case.dart';

class AddProductCubit extends Cubit<BaseState<Unit>> {
  final AddProductUseCase _useCase;

  AddProductCubit({required AddProductUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> addProduct({required Product product}) async {
    emit(state.setInProgressState());
    final result = await _useCase(product);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (unit) => emit(state.setSuccessState(unit)),
    );
  }
}
