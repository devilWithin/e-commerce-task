import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fudex_test/features/category/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    final String response = await rootBundle.loadString(
        'lib/features/category/data/data_source/category_response.json');
    final data = json.decode(response);
    final categories = data['categories'] as List;
    return categories
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
