import 'package:flutter/material.dart';
import 'package:fudex_test/core/widgets/dashed_border_container.dart';

class DottedBorderWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final List<double> dashPattern;
  final double height;
  final double width;
  const DottedBorderWidget(
      {super.key,
      required this.child,
      required this.padding,
      required this.dashPattern,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DottedBorder(
        color: Colors.grey.withOpacity(0.2),
        padding: padding,
        radius: const Radius.circular(10),
        borderType: BorderType.RRect,
        dashPattern: dashPattern,
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
        child: child,
      ),
    );
  }
}
