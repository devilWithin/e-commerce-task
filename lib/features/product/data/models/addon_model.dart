import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/addon.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'addon_model.g.dart';

@HiveType(typeId: 1)
class AddonModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const AddonModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension AddonModelX on AddonModel {
  Addon toDomain() => Addon(id: id, name: name);
}
