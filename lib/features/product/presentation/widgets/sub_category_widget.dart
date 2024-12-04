import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_addons_from_sub_category_cubit.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_sub_categories_cubit.dart';
import 'package:fudex_test/generated/l10n.dart';
import 'package:fudex_test/injection_container.dart';

class SubCategoryWidget extends StatefulWidget {
  const SubCategoryWidget({super.key});

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  final _getSubCategories = sl<GetSubCategoriesCubit>();
  final _getAddonsFromSubCategoryCubit = sl<GetAddonsFromSubCategoryCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSubCategoriesCubit, BaseState<List<Category>>>(
      bloc: _getSubCategories,
      builder: (context, state) {
        if (state.isSuccess) {
          return Column(
            children: [
              RequiredTextHeadline(headline: S.of(context).secondaryCategory),
              CustomDropDownMenu<Category>(
                itemBuilder: (value) => Text(value.name),
                onTap: (value) {
                  print(value.addons.toString());
                  _getAddonsFromSubCategoryCubit
                      .getAddonsFromSubCategory(value.addons!);
                },
                withBorder: true,
                title: S.of(context).secondaryCategory,
                options: state.item!,
              )
            ],
          );
        } else if (state.isFailure) {
          return Center(
            child: Text(state.failure!.message),
          );
        } else if (state.isInProgress) {
          return const Center(child: LinearProgressIndicator());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
