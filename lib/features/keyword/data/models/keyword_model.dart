import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/keyword/domain/entities/keyword.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 6)
class KeywordModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const KeywordModel({required this.id, required this.name});

  factory KeywordModel.fromJson(Map<String, dynamic> json) => KeywordModel(
        id: json['id'],
        name: json['name'],
      );

  @override
  List<Object?> get props => [id, name];
}

extension KeywordModelX on KeywordModel {
  Keyword toDomain() => Keyword(id: id, name: name);
}
