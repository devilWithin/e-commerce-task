import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/domain/repositories/product_repository.dart';

class AddProductUseCase extends UseCase<Unit, Product> {
  final ProductRepository _repository;

  AddProductUseCase({required ProductRepository repository})
      : _repository = repository;
  @override
  Future<Either<Failure, Unit>> call(Product params) async {
    return await _repository.addProduct(product: params);
  }
}
