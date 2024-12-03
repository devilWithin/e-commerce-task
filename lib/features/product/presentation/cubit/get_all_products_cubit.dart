import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/domain/use_cases/get_all_products_use_case.dart';

class GetAllProductsCubit extends Cubit<BaseState<List<Product>>> {
  final GetAllProductsUseCase _useCase;

  GetAllProductsCubit({required GetAllProductsUseCase useCase})
      : _useCase = useCase,
        super(const BaseState());

  Future<void> getAllProducts() async {
    emit(state.setInProgressState());
    final result = await _useCase(NoParams());
    result.fold((failure) => emit(state.setFailureState(failure)),
        (products) => emit(state.setSuccessState(products)));
  }
}
