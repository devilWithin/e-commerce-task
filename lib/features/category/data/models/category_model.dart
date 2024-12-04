import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/category/data/models/addon_model.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<AddonModel>? addons;

  const CategoryModel({required this.id, required this.name, this.addons});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'addons': addons?.map((e) => e.toJson()).toList(),
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      addons: json['addons'] != null
          ? (json['addons'] as List)
              .map((e) => AddonModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [id, name, addons];
}

extension CategoryModelX on CategoryModel {
  Category toDomain() => Category(
      id: id, name: name, addons: addons?.map((e) => e.toDomain()).toList());
}
