import 'package:flutter/material.dart';
import 'package:fudex_test/core/utils/app_colors.dart';

class CustomCheckBoxDropDown<T> extends StatefulWidget {
  final List<T> options;
  final String title;
  final ValueChanged<List<T>> onSelectionChanged;
  final Color filledColor;
  final bool withBorder;
  final Widget Function(T) itemBuilder;

  const CustomCheckBoxDropDown({
    super.key,
    required this.options,
    required this.title,
    required this.onSelectionChanged,
    required this.itemBuilder,
    this.withBorder = false,
    this.filledColor = AppColors.formFieldFilledColor,
  });

  @override
  State<CustomCheckBoxDropDown<T>> createState() =>
      _CustomCheckBoxDropDownState<T>();
}

class _CustomCheckBoxDropDownState<T> extends State<CustomCheckBoxDropDown<T>> {
  List<T> selectedValues = [];

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
                          if (selectedValues.contains(e)) {
                            selectedValues.remove(e);
                          } else {
                            selectedValues.add(e);
                          }
                        });
                        widget.onSelectionChanged(selectedValues);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.itemBuilder.call(e),
                          Checkbox(
                            value: selectedValues.contains(e),
                            activeColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedValues.add(e);
                                } else {
                                  selectedValues.remove(e);
                                }
                              });
                              widget.onSelectionChanged(selectedValues);
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
                    selectedValues.isNotEmpty
                        ? Text(
                            '${selectedValues.length} selected',
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.blue,
                                  fontSize: 12,
                                ),
                          )
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
