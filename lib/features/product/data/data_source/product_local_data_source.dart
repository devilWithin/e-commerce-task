import 'package:fudex_test/core/local_db/local_db_consumer.dart';
import 'package:fudex_test/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts({required List<ProductModel> product});

  Future<List<ProductModel>> getCachedProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final HiveConsumer<List<ProductModel>> _hiveConsumer;

  ProductLocalDataSourceImpl(
      {required HiveConsumer<List<ProductModel>> hiveConsumer})
      : _hiveConsumer = hiveConsumer;

  @override
  Future<void> cacheProducts({required List<ProductModel> product}) async {
    await _hiveConsumer.cacheItems(product);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return await _hiveConsumer.getCachedItems();
  }
}
