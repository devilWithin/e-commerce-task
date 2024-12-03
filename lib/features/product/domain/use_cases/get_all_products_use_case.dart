import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/base_usecase.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/domain/repositories/product_repository.dart';

class GetAllProductsUseCase extends UseCase<List<Product>, NoParams> {
  final ProductRepository _repository;

  GetAllProductsUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await _repository.getAllProducts();
  }
}
