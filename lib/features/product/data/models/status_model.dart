import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/status.dart';

class StatusModel extends Equatable {
  final int id;
  final String name;

  const StatusModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension StatusModelX on StatusModel {
  Status toDomain() => Status(id: id, name: name);
}
