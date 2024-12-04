import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/core/error/failure.dart';
import 'package:fudex_test/features/product/data/data_source/product_local_data_source.dart';
import 'package:fudex_test/features/product/data/data_source/product_remote_data_source.dart';
import 'package:fudex_test/features/product/data/models/product_model.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;
  final ProductLocalDataSource _localDataSource;

  ProductRepositoryImpl(
      {required ProductRemoteDataSource remoteDataSource,
      required ProductLocalDataSource localDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

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
    //using only local data source to demonstrate the use of SSOT(Single Source of Truth)
    try {
      final response = await _localDataSource.getCachedProducts();
      if (response.isNotEmpty) {
        final products = response.map((e) => e.toDomain()).toList();
        return Right(products);
      } else {
        try {
          final response = await _remoteDataSource.getAllProducts();
          final products = response.map((e) => e.toDomain()).toList();
          await _localDataSource.cacheProducts(product: response);
          return Right(products);
        } on ServerException catch (e) {
          return Left(ServerFailure(message: e.toString()));
        }
      }
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(
      {required String productId}) async {
    try {
      await _remoteDataSource.deleteProduct(productId: productId);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
