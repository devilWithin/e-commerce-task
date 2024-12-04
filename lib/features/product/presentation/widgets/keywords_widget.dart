import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/features/keyword/domain/entities/keyword.dart';
import 'package:fudex_test/features/keyword/presentation/cubits/get_keywords_by_category_id_cubit.dart';
import 'package:fudex_test/generated/l10n.dart';
import 'package:fudex_test/injection_container.dart';

class KeywordsWidget extends StatefulWidget {
  const KeywordsWidget({super.key});

  @override
  State<KeywordsWidget> createState() => _KeywordsWidgetState();
}

class _KeywordsWidgetState extends State<KeywordsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetKeywordsByCategoryIdCubit, BaseState<List<Keyword>>>(
      builder: (context, state) {
        if (state.isSuccess) {
          return CustomDropDownMenu<Keyword>(
            itemBuilder: (value) => Text(value.name),
            onTap: (value) {},
            withBorder: true,
            title: S.of(context).mainCategory,
            options: state.item!,
          );
        } else if (state.isFailure) {
          return Center(
            child: Text(state.failure!.message),
          );
        }
        return const Center(child: LinearProgressIndicator());
      },
    );
  }
}
