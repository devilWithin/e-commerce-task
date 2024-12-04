import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/category/domain/entities/addon.dart';
import 'package:fudex_test/features/category/data/models/category_model.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final List<Addon>? addons;

  const Category({required this.id, required this.name, this.addons});

  @override
  List<Object?> get props => [id, name, addons];
}

extension CategoryX on Category {
  CategoryModel toData() => CategoryModel(id: id, name: name);
}
