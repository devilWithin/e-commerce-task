import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final double height;
  final void Function() onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  const CustomElevatedButton(
      {super.key,
      this.width = double.infinity,
      this.height = 42,
      required this.onPressed,
      required this.title,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(width, height),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold, color: textColor ?? Colors.white),
      ),
    );
  }
}
