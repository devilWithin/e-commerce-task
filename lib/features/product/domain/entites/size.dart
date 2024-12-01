import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/data/models/size_model.dart';

class SizeEntity extends Equatable {
  final int id;
  final String name;

  const SizeEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension SizeEntityX on SizeEntity {
  SizeModel toData() => SizeModel(id: id, name: name);
}
