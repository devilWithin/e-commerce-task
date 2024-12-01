import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/size.dart';

class SizeModel extends Equatable {
  final int id;
  final String name;

  const SizeModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension SizeModelX on SizeModel {
  SizeEntity toDomain() => SizeEntity(id: id, name: name);
}
