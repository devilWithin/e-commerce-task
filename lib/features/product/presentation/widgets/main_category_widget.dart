import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/features/category/domain/entities/category.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_categories_cubit.dart';
import 'package:fudex_test/features/category/presentation/cubits/get_sub_categories_cubit.dart';
import 'package:fudex_test/generated/l10n.dart';
import 'package:fudex_test/injection_container.dart';

class MainCategoryWidget extends StatefulWidget {
  const MainCategoryWidget({super.key});

  @override
  State<MainCategoryWidget> createState() => _MainCategoryWidgetState();
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  final _getAllCategories = sl<GetCategoriesCubit>();
  final _getAllSubCategories = sl<GetSubCategoriesCubit>();

  @override
  void initState() {
    super.initState();
    _getAllCategories.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RequiredTextHeadline(headline: S.of(context).mainCategory),
        BlocBuilder<GetCategoriesCubit, BaseState<List<Category>>>(
          bloc: _getAllCategories,
          builder: (context, state) {
            if (state.isSuccess) {
              return CustomDropDownMenu<Category>(
                itemBuilder: (value) => Text(value.name),
                onTap: (value) {
                  _getAllSubCategories.getSubCategories(categoryId: value.id);
                },
                withBorder: true,
                title: S.of(context).mainCategory,
                options: state.item!,
              );
            } else if (state.isFailure) {
              return Column(
                children: [
                  Center(
                    child: Text(state.failure!.message),
                  ),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      _getAllCategories.getCategories();
                    },
                    child: Text(S.of(context).retry),
                  )
                ],
              );
            }
            return const Center(child: LinearProgressIndicator());
          },
        ),
      ],
    );
  }
}
