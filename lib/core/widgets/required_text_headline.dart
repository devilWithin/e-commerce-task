import 'package:flutter/material.dart';
import 'package:fudex_test/configs/theme/styles_manager.dart';

class RequiredTextHeadline extends StatelessWidget {
  final bool isRequired;
  final String headline;
  const RequiredTextHeadline(
      {super.key, this.isRequired = true, required this.headline});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          headline,
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 2),
        if (isRequired)
          Text(
            '*',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.red),
          ),
      ],
    );
  }
}
