import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/size.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'size_model.g.dart';

@HiveType(typeId: 3)
class SizeModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const SizeModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension SizeModelX on SizeModel {
  SizeEntity toDomain() => SizeEntity(id: id, name: name);
}
