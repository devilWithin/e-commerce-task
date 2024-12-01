import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/addon.dart';

class AddonModel extends Equatable {
  final int id;
  final String name;

  const AddonModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension AddonModelX on AddonModel {
  Addon toDomain() => Addon(id: id, name: name);
}
