import 'package:dartz/dartz.dart';
import 'package:fudex_test/core/api/api_consumer.dart';
import 'package:fudex_test/core/error/exception.dart';
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
    try {
      final ApiResponse response = await _apiConsumer.post(
        '/products',
        body: newProduct.toJson(),
      );
      if (response.statusCode != 200) {
        throw ServerException.localized(
          messageAr: 'Some arabic message',
          messageEn: 'Some English Message',
        );
      }
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> editProduct({required ProductModel product}) async {
    return unit;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final ApiResponse response = await _apiConsumer.get('/products');
      if (response.statusCode != 200) {
        throw ServerException.localized(
          messageAr: 'Some arabic message',
          messageEn: 'Some English Message',
        );
      }
      final products = List<ProductModel>.from(
        response.data.map((product) => ProductModel.fromJson(product)),
      );
      return products;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> deleteProduct({required String productId}) async {
    try {
      final ApiResponse response =
          await _apiConsumer.delete('/products/$productId');
      if (response.statusCode != 200) {
        throw ServerException.localized(
          messageAr: 'Some arabic message',
          messageEn: 'Some English Message',
        );
      }
      return unit;
    } catch (e) {
      rethrow;
    }
  }
}
