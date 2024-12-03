import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Unit>> addProduct({required Product product});

  Future<Either<Failure, Unit>> editProduct({required Product product});

  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Unit>> deleteProduct({required String productId});
}
