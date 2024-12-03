import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/category.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const CategoryModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension CategoryModelX on CategoryModel {
  Category toDomain() => Category(id: id, name: name);
}
