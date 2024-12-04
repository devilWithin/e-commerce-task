import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/features/category/domain/entities/addon.dart';

class SelectAddonsCubit extends Cubit<List<int>> {
  SelectAddonsCubit() : super([]);

  List<int> selectedAddonsIds = [];

  void getSelectedAddons(List<Addon> newAddons) {
    selectedAddonsIds = newAddons.map((e) => e.id).toList();
    emit(selectedAddonsIds);
  }
}
