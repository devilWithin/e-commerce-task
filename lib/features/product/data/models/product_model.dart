import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fudex_test/features/product/data/models/addon_model.dart';
import 'package:fudex_test/features/product/data/models/category_model.dart';
import 'package:fudex_test/features/product/data/models/size_model.dart';
import 'package:fudex_test/features/product/data/models/status_model.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';

class ProductModel extends Equatable {
  final String name;
  final String description;
  final String mainImage;
  final List<String> secondaryImages;
  final CategoryModel mainCategory;
  final CategoryModel secondaryCategory;
  final String price;
  final List<AddonModel> addons;
  final List<Color> availableColors;
  final List<SizeModel> sizes;
  final StatusModel status;
  final List<String> keywords;

  const ProductModel({
    required this.name,
    required this.description,
    required this.mainImage,
    required this.secondaryImages,
    required this.mainCategory,
    required this.secondaryCategory,
    required this.price,
    required this.addons,
    required this.availableColors,
    required this.sizes,
    required this.status,
    required this.keywords,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        mainImage,
        secondaryImages,
        mainCategory,
        secondaryCategory,
        price,
        addons,
        availableColors,
        sizes,
        status,
        keywords
      ];
}

extension ProductModelX on ProductModel {
  Product toDomain() => Product(
        name: name,
        description: description,
        mainImage: mainImage,
        secondaryImages: secondaryImages,
        mainCategory: mainCategory.toDomain(),
        secondaryCategory: secondaryCategory.toDomain(),
        price: price,
        addons: addons.map((e) => e.toDomain()).toList(),
        availableColors: availableColors,
        sizes: sizes.map((e) => e.toDomain()).toList(),
        status: status.toDomain(),
        keywords: keywords,
      );
}
