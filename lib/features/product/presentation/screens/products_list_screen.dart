import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudex_test/configs/routing/routes.dart';
import 'package:fudex_test/core/utils/app_colors.dart';
import 'package:fudex_test/core/utils/asset_manager.dart';
import 'package:fudex_test/core/widgets/custom_drop_down_menu.dart';
import 'package:fudex_test/core/widgets/custom_elevated_button.dart';
import 'package:fudex_test/core/widgets/scaffold_with_title.dart';
import 'package:fudex_test/features/product/domain/entites/category.dart';
import 'package:fudex_test/generated/l10n.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithTitle(
      bottomSheetWidget: CustomElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.addProductScreen);
        },
        title: S.of(context).addProduct,
      ),
      title: S.of(context).productsList,
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            cursorHeight: 24,
            focusNode: _searchFocusNode,
            onTapOutside: (value) => _searchFocusNode.unfocus(),
            decoration: InputDecoration(
              hintText: S.of(context).search,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.hintColor,
                    fontWeight: FontWeight.w400,
                  ),
              constraints: const BoxConstraints(maxHeight: 36),
              prefixIcon: const Icon(Icons.search, size: 25),
              suffixIcon: IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: const Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => _searchController.clear(),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomDropDownMenu<Category>(
            options: const [
              Category(id: 1, name: "Category 1"),
              Category(id: 2, name: "Category 2"),
              Category(id: 3, name: "Category 3"),
              Category(id: 4, name: "Category 4"),
            ],
            title: S.of(context).category,
            filledColor: Colors.white,
            onTap: (category) {},
            withBorder: true,
            itemBuilder: (category) => Text(category.name),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const ProductItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

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
