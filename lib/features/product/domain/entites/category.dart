import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/data/models/category_model.dart';

class Category extends Equatable {
  final int id;
  final String name;

  const Category({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension CategoryX on Category {
  CategoryModel toData() => CategoryModel(id: id, name: name);
}
