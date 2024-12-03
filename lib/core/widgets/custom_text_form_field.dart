import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudex_test/core/utils/app_colors.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/generated/l10n.dart';
import 'package:intl/intl.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? headline;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool showHeadline;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.headline,
    this.isRequired = true,
    this.showHeadline = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showHeadline)
          RequiredTextHeadline(
            isRequired: widget.isRequired,
            headline: widget.headline!,
          ),
        Directionality(
          textDirection: Intl.getCurrentLocale() == 'ar'
              ? ui.TextDirection.rtl
              : ui.TextDirection.ltr,
          child: TextFormField(
            controller: widget.controller,
            obscureText: !showPassword && widget.isPassword,
            obscuringCharacter: '*',
            keyboardType: widget.keyboardType,
            validator: (value) {
              if (value!.isEmpty) {
                return S.of(context).fieldIsRequired;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: AppColors.formFieldFilledColor,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        showPassword = !showPassword;
                        setState(() {});
                      },
                      icon: Icon(
                        showPassword
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.formFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              errorMaxLines: 2,
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              labelText: widget.label,
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 0.2),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
