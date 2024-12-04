import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/features/category/domain/entities/addon.dart';

class GetAddonsFromSubCategoryCubit extends Cubit<List<Addon>> {
  GetAddonsFromSubCategoryCubit() : super([]);

  void getAddonsFromSubCategory(List<Addon> addons) => emit(addons);
}
