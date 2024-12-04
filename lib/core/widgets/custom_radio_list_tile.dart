import 'package:flutter/material.dart';
import 'package:fudex_test/configs/theme/styles_manager.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T? groupValue;
  final T value;
  final Function(T?) onChanged;
  final String title;
  final bool withBorder;
  const CustomRadioListTile(
      {super.key,
      this.groupValue,
      required this.onChanged,
      required this.value,
      this.withBorder = true,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      value: value,
      dense: true,
      groupValue: groupValue,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      activeColor: Colors.white,
      fillColor: WidgetStateColor.resolveWith((states) => Colors.black),
      contentPadding: EdgeInsets.zero,
      shape: withBorder
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.grey),
            )
          : null,
      title: Text(
        title,
        style: context.bodyMedium,
      ),
      onChanged: (T? value) {
        onChanged(value);
      },
    );
  }
}
