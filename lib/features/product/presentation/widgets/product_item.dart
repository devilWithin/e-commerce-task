import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudex_test/core/utils/asset_manager.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/generated/l10n.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Row(
              children: [
                Text(
                  S.of(context).activateProduct,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 26,
                      child: Switch.adaptive(
                        value: true,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.white,
                        activeTrackColor: Colors.blue,
                        onChanged: (value) => print(value),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 12,
                      child: SvgPicture.asset(
                        AssetManager.delete,
                        width: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      radius: 12,
                      child: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Row(
            children: [
              const FlutterLogo(size: 90),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "شنطة حريمى هاند ميد خوص",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                  ),
                  Text(
                    "300 رس",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Row(
                    children: List.generate(4, (index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.blue, width: 1.2),
                        ),
                        child: Text(
                          'M',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(height: 1),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(4, (index) {
                      return Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.yellowAccent,
                          border: Border.all(color: Colors.blue, width: 1.2),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
