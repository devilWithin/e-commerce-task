import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fudex_test/features/keyword/data/models/keyword_model.dart';

abstract class KeywordRemoteDataSource {
  Future<List<KeywordModel>> getKeywordsByCategoryIdUseCase(
      {required int categoryId});
}

class KeywordRemoteDataSourceImpl implements KeywordRemoteDataSource {
  @override
  Future<List<KeywordModel>> getKeywordsByCategoryIdUseCase(
      {required int categoryId}) async {
    final String response = await rootBundle.loadString(
        'lib/features/keywords/data/data_source/keywords_response.json');
    final data = json.decode(response);
    final categories = data['keywords'] as List;
    return categories
        .map((category) => KeywordModel.fromJson(category))
        .toList();
  }
}
