import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fudex_test/features/product/data/models/product_model.dart';
import 'package:fudex_test/features/product/domain/entites/addon.dart';
import 'package:fudex_test/features/product/domain/entites/category.dart';
import 'package:fudex_test/features/product/domain/entites/size.dart';
import 'package:fudex_test/features/product/domain/entites/status.dart';

class Product extends Equatable {
  final String name;
  final String description;
  final String mainImage;
  final List<String> secondaryImages;
  final Category mainCategory;
  final Category secondaryCategory;
  final String price;
  final List<Addon> addons;
  final List<Color> availableColors;
  final List<SizeEntity> sizes;
  final Status status;
  final List<String> keywords;

  const Product({
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

extension ProductExtension on Product {
  ProductModel toData() => ProductModel(
      name: name,
      description: description,
      mainImage: mainImage,
      secondaryImages: secondaryImages,
      mainCategory: mainCategory.toData(),
      secondaryCategory: secondaryCategory.toData(),
      price: price,
      addons: addons
          .map(
            (e) => e.toData(),
          )
          .toList(),
      availableColors: availableColors,
      sizes: sizes.map((e) => e.toData()).toList(),
      status: status.toData(),
      keywords: keywords);
}
