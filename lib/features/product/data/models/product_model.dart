import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fudex_test/features/product/data/models/addon_model.dart';
import 'package:fudex_test/features/product/data/models/category_model.dart';
import 'package:fudex_test/features/product/data/models/color_model.dart';
import 'package:fudex_test/features/product/data/models/size_model.dart';
import 'package:fudex_test/features/product/data/models/status_model.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String mainImage;
  @HiveField(3)
  final List<String> secondaryImages;
  @HiveField(4)
  final CategoryModel mainCategory;
  @HiveField(5)
  final CategoryModel secondaryCategory;
  @HiveField(6)
  final String price;
  @HiveField(7)
  final List<AddonModel> addons;
  @HiveField(8)
  final List<ColorModel> availableColors;
  @HiveField(9)
  final List<SizeModel> sizes;
  @HiveField(10)
  final StatusModel status;
  @HiveField(11)
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
        availableColors: availableColors.map((e) => e.toDomain()).toList(),
        sizes: sizes.map((e) => e.toDomain()).toList(),
        status: status.toDomain(),
        keywords: keywords,
      );
}
