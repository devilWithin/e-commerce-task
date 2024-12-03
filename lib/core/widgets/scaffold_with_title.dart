import 'package:flutter/material.dart';
import 'package:fudex_test/core/utils/app_constants.dart';

class ScaffoldWithTitle extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomSheetWidget;
  const ScaffoldWithTitle({
    super.key,
    required this.title,
    required this.body,
    this.bottomSheetWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: bottomSheetWidget != null
          ? BottomAppBar(
              elevation: 10,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppConstants.screenHorizontalPadding,
                  vertical: AppConstants.screenVerticalPadding,
                ),
                child: bottomSheetWidget,
              ),
            )
          : null,
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenHorizontalPadding,
          vertical: AppConstants.screenVerticalPadding,
        ),
        child: body,
      ),
    );
  }
}
