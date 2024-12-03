import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/api_consumer.dart';
import 'package:fudex_test/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<Unit> addProduct({required ProductModel newProduct});

  Future<Unit> editProduct({required ProductModel product});

  Future<List<ProductModel>> getAllProducts();

  Future<Unit> deleteProduct({required String productId});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProductRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<Unit> addProduct({required ProductModel newProduct}) async {
    return unit;
  }

  @override
  Future<Unit> editProduct({required ProductModel product}) async {
    return unit;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteProduct({required String productId}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
}
