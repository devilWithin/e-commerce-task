import 'package:flutter/material.dart';
import 'package:fudex_test/core/utils/app_colors.dart';

class CustomDropDownMenu<T> extends StatefulWidget {
  final List<T> options;
  final String title;
  final ValueChanged<T> onTap;
  final Color filledColor;
  final bool withBorder;
  final Widget Function(T) itemBuilder;

  const CustomDropDownMenu({
    super.key,
    required this.options,
    required this.title,
    required this.onTap,
    required this.itemBuilder,
    this.withBorder = false,
    this.filledColor = AppColors.formFieldFilledColor,
  });

  @override
  State<CustomDropDownMenu<T>> createState() => _CustomDropDownMenuState<T>();
}

class _CustomDropDownMenuState<T> extends State<CustomDropDownMenu<T>> {
  T? groupValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (details) async {
        double left = details.globalPosition.dx;
        double top = details.globalPosition.dy;
        final screenSize = MediaQuery.of(context).size;
        await showMenu(
            context: context,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            position: RelativeRect.fromLTRB(
              left,
              top,
              screenSize.width - left,
              screenSize.height - top,
            ),
            items: widget.options
                .map((e) => PopupMenuItem(
                      value: e,
                      onTap: () {
                        setState(() {
                          groupValue = e;
                        });
                        widget.onTap(groupValue as T);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.itemBuilder.call(e),
                          Radio<T>(
                            value: e,
                            groupValue: groupValue,
                            activeColor: Colors.black,
                            fillColor: WidgetStateColor.resolveWith(
                                (states) => Colors.black),
                            onChanged: (T? value) {
                              setState(() {
                                groupValue = value;
                              });
                              widget.onTap(groupValue as T);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ))
                .toList());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.filledColor,
          border: Border.all(
            color: widget.withBorder
                ? AppColors.formFieldBorderColor
                : Colors.transparent,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    groupValue != null
                        ? widget.itemBuilder.call(groupValue as T)
                        : Text(
                            widget.title,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.blue,
                                  fontSize: 12,
                                ),
                          ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            if (!widget.withBorder)
              const Divider(
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
