import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/product/domain/repositories/product_repository.dart';

class DeleteProductUseCase extends UseCase<Unit, String> {
  final ProductRepository _repository;

  DeleteProductUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await _repository.deleteProduct(productId: params);
  }
}
