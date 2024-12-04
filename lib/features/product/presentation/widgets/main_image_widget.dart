import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudex_test/core/utils/asset_manager.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/generated/l10n.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorderWidget(
      dashPattern: const [10, 5],
      width: MediaQuery.sizeOf(context).width / 2.2,
      height: 120,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Chip(label: Text(S.of(context).mainImage)),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.2),
                radius: 12,
                child: SvgPicture.asset(
                  AssetManager.delete,
                  width: 15,
                ),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_sharp,
              size: 30,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
