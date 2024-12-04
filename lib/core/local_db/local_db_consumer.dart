import 'package:hive/hive.dart';

abstract class LocalDBConsumer<T> {
  Future<void> cacheItems(T items);
  Future<T> getCachedItems();
}

class HiveConsumer<T> implements LocalDBConsumer<T> {
  @override
  Future<void> cacheItems(T items) async {
    final box = await Hive.openBox<T>(T.toString());
    await box.clear();
    await box.addAll(items as List<T>);
  }

  @override
  Future<T> getCachedItems() async {
    final box = await Hive.openBox<T>(T.toString());
    return box.values.toList() as T;
  }
}
