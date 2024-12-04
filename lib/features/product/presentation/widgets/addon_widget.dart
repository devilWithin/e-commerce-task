import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/features/category/domain/entities/addon.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_addons_from_sub_category_cubit.dart';
import 'package:fudex_test/features/category/presentation/cubits/select_addons_cubit.dart';
import 'package:fudex_test/generated/l10n.dart';
import 'package:fudex_test/injection_container.dart';

class AddonWidget extends StatefulWidget {
  const AddonWidget({super.key});

  @override
  State<AddonWidget> createState() => _AddonWidgetState();
}

class _AddonWidgetState extends State<AddonWidget> {
  final _selectAddonsCubit = sl<SelectAddonsCubit>();
  final _getAddonsFromSubCategoryCubit = sl<GetAddonsFromSubCategoryCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddonsFromSubCategoryCubit, List<Addon>>(
      bloc: _getAddonsFromSubCategoryCubit,
      builder: (context, state) {
        if (state.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return CustomCheckBoxDropDown<Addon>(
            itemBuilder: (value) => Text(value.nameAr),
            onSelectionChanged: (value) {
              _selectAddonsCubit.getSelectedAddons(value);
            },
            withBorder: true,
            title: S.of(context).addons,
            options: state,
          );
        }
      },
    );
  }
}
