import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/addon/data/models/addon_model.dart';

class Addon extends Equatable {
  final int id;
  final String name;

  const Addon({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

extension AddonX on Addon {
  AddonModel toData() => AddonModel(id: id, name: name);
}
