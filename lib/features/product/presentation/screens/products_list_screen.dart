import 'package:flutter/material.dart';
import 'package:fudex_test/configs/routing/routes.dart';
import 'package:fudex_test/core/utils/app_colors.dart';
import 'package:fudex_test/core/widgets/custom_drop_down_menu.dart';
import 'package:fudex_test/core/widgets/custom_elevated_button.dart';
import 'package:fudex_test/core/widgets/scaffold_with_title.dart';
import 'package:fudex_test/features/product/domain/entites/category.dart';
import 'package:fudex_test/features/product/presentation/widgets/products_list.dart';
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
          const ProductsList(),
        ],
      ),
    );
  }
}
