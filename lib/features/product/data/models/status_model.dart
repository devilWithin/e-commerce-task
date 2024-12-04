import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/status.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'status_model.g.dart';

@HiveType(typeId: 4)
class StatusModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const StatusModel({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  @override
  List<Object?> get props => [id, name];
}

extension StatusModelX on StatusModel {
  Status toDomain() => Status(id: id, name: name);
}
