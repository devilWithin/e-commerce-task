import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fudex_test/core/error/exception.dart';
import 'package:fudex_test/features/category/data/models/category_model.dart';

abstract class SubCategoryRemoteDataSource {
  Future<List<CategoryModel>> getSubCategories({required int categoryId});
}

class SubCategoryRemoteDataSourceImpl implements SubCategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getSubCategories(
      {required int categoryId}) async {
    try {
      final String response = await rootBundle.loadString(
          'lib/features/category/data/data_source/sub_category_response.json');
      final data = json.decode(response);
      final subCategories = data['sub_categories'] as List;
      return subCategories
          .map((subCategory) => CategoryModel.fromJson(subCategory))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }
}
