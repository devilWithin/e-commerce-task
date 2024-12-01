import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/category.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;

  const CategoryModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension CategoryModelX on CategoryModel {
  Category toDomain() => Category(id: id, name: name);
}
