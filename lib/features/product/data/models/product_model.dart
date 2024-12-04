import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/category/data/models/addon_model.dart';
import 'package:fudex_test/features/category/data/models/category_model.dart';
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
  final List<AddonModel>? addons;
  @HiveField(8)
  final List<ColorModel>? availableColors;
  @HiveField(9)
  final List<SizeModel>? sizes;
  @HiveField(10)
  final List<StatusModel>? status;
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'mainImage': mainImage,
      'secondaryImages': secondaryImages,
      'mainCategory': mainCategory.toJson(),
      'secondaryCategory': secondaryCategory.toJson(),
      'price': price,
      'addons': addons?.map((e) => e.toJson()).toList(),
      'availableColors': availableColors?.map((e) => e.toJson()).toList(),
      'sizes': sizes?.map((e) => e.toJson()).toList(),
      'status': status?.map((e) => e.toJson()).toList(),
      'keywords': keywords,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      description: json['description'] as String,
      mainImage: json['mainImage'] as String,
      secondaryImages:
          (json['secondaryImages'] as List).map((e) => e as String).toList(),
      mainCategory:
          CategoryModel.fromJson(json['mainCategory'] as Map<String, dynamic>),
      secondaryCategory: CategoryModel.fromJson(
          json['secondaryCategory'] as Map<String, dynamic>),
      price: json['price'] as String,
      addons: json['addons'] != null
          ? (json['addons'] as List)
              .map((e) => AddonModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      availableColors: json['availableColors'] != null
          ? (json['availableColors'] as List)
              .map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      sizes: json['sizes'] != null
          ? (json['sizes'] as List)
              .map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      status: json['status'] != null
          ? (json['status'] as List)
              .map((e) => StatusModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      keywords: (json['keywords'] as List).map((e) => e as String).toList(),
    );
  }

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
        addons: addons?.map((e) => e.toDomain()).toList(),
        availableColors: availableColors?.map((e) => e.toDomain()).toList(),
        sizes: sizes?.map((e) => e.toDomain()).toList(),
        status: status?.map((e) => e.toDomain()).toList(),
        keywords: keywords,
      );
}
