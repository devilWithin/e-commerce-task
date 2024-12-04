import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fudex_test/features/addon/data/models/addon_model.dart';

abstract class AddonRemoteDataSource {
  Future<List<AddonModel>> getAddonsBySubCategoryId(
      {required int subCategoryId});
}

class AddonRemoteDataSourceImpl implements AddonRemoteDataSource {
  @override
  Future<List<AddonModel>> getAddonsBySubCategoryId(
      {required int subCategoryId}) async {
    final String response = await rootBundle
        .loadString('lib/features/addon/data/data_source/addons_response.json');
    final data = json.decode(response);
    final addons = data['addons'] as List;
    return addons.map((category) => AddonModel.fromJson(category)).toList();
  }
}
