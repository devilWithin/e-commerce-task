import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/product/data/data_source/product_remote_data_source.dart';
import 'package:fudex_test/features/product/data/models/product_model.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl({required ProductRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Unit>> addProduct({required Product product}) async {
    try {
      await _remoteDataSource.addProduct(newProduct: product.toData());
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> editProduct({required Product product}) async {
    try {
      await _remoteDataSource.editProduct(product: product.toData());
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final products = await _remoteDataSource.getAllProducts();
      return Right(products.map((e) => e.toDomain()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
