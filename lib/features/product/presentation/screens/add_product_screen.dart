import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudex_test/core/utils/asset_manager.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/features/category/domain/entities/addon.dart';
import 'package:fudex_test/features/category/presentation/cubits/select_addons_cubit.dart';
import 'package:fudex_test/features/product/domain/entites/size.dart';
import 'package:fudex_test/features/product/presentation/widgets/addon_widget.dart';
import 'package:fudex_test/features/product/presentation/widgets/main_category_widget.dart';
import 'package:fudex_test/features/product/presentation/widgets/main_image_widget.dart';
import 'package:fudex_test/features/product/presentation/widgets/sub_category_widget.dart';
import 'package:fudex_test/generated/l10n.dart';
import 'package:fudex_test/injection_container.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _selectAddonsCubit = sl<SelectAddonsCubit>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithTitle(
      title: S.of(context).add,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).productImages),
            const SizedBox(height: 8),
            DottedBorder(
              color: Colors.grey.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(vertical: 24),
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              dashPattern: const [15, 5],
              strokeCap: StrokeCap.round,
              strokeWidth: 2,
              child: Column(
                children: [
                  const MainImageWidget(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return DottedBorderWidget(
                        width: MediaQuery.sizeOf(context).width / 8,
                        height: 51,
                        dashPattern: const [10, 3],
                        padding: const EdgeInsets.all(2),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle_outline_sharp,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  Text(S.of(context).imageMustNotBeMoreThan),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: TextEditingController(),
              label: "شنطة حربمى هاند ميد خوص",
              headline: S.of(context).productName,
            ),
            const SizedBox(height: 8),
            const MainCategoryWidget(),
            const SizedBox(height: 8),
            const SubCategoryWidget(),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: TextEditingController(),
              label: S.of(context).rsa,
              headline: S.of(context).productPrice,
            ),
            const SizedBox(height: 8),
            const AddonWidget(),
            const SizedBox(height: 8),
            // if (_selectAddonsCubit.selectedAddonsIds.contains(0))
            BlocBuilder<SelectAddonsCubit, List<int>>(
              bloc: _selectAddonsCubit,
              builder: (context, state) {
                if (state.isEmpty) {
                  return const SizedBox.shrink();
                } else if (_selectAddonsCubit.selectedAddonsIds.contains(0)) {
                  return Column(children: [
                    RequiredTextHeadline(headline: S.of(context).specifyColor),
                    CustomCheckBoxDropDown<Color>(
                      itemBuilder: (value) => Container(
                        height: 40,
                        width: 40,
                        color: value,
                      ),
                      onSelectionChanged: (value) {},
                      withBorder: true,
                      title: S.of(context).addons,
                      options: const [
                        Colors.blue,
                        Colors.yellowAccent,
                        Colors.black
                      ],
                    ),
                  ]);
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 8),
            // if (_selectAddonsCubit.selectedAddonsIds.contains(1))
            BlocBuilder<SelectAddonsCubit, List<int>>(
              bloc: _selectAddonsCubit,
              builder: (context, state) {
                if (state.isEmpty) {
                  return const SizedBox.shrink();
                } else if (_selectAddonsCubit.selectedAddonsIds.contains(1)) {
                  return Column(children: [
                    RequiredTextHeadline(headline: S.of(context).specifySize),
                    CustomCheckBoxDropDown<SizeEntity>(
                        itemBuilder: (value) => Text(value.name),
                        onSelectionChanged: (value) {},
                        withBorder: true,
                        title: S.of(context).addons,
                        options: const [
                          SizeEntity(id: 0, name: 'XS'),
                          SizeEntity(id: 1, name: 'S'),
                          SizeEntity(id: 2, name: 'M'),
                          SizeEntity(id: 3, name: 'L'),
                          SizeEntity(id: 4, name: 'XL'),
                          SizeEntity(id: 5, name: '2XL'),
                          SizeEntity(id: 6, name: '3XL'),
                        ]),
                  ]);
                }
                return const SizedBox.shrink();
              },
            ),
            // RequiredTextHeadline(headline: S.of(context).specifySize),
            // CustomDropDownMenu<SizeEntity>(
            //   itemBuilder: (value) => Text(value.name),
            //   onTap: (value) => print(value),
            //   withBorder: true,
            //   title: S.of(context).mainCategory,
            //   options: const [
            //     SizeEntity(id: 0, name: 'XS'),
            //     SizeEntity(id: 1, name: 'S'),
            //     SizeEntity(id: 2, name: 'M'),
            //     SizeEntity(id: 3, name: 'L'),
            //     SizeEntity(id: 4, name: 'XL'),
            //     SizeEntity(id: 5, name: '2XL'),
            //     SizeEntity(id: 6, name: '3XL'),
            //   ],
            // ),
            // const SizedBox(height: 8),
            // RequiredTextHeadline(headline: S.of(context).productStatus),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Flexible(
            //       child: CustomRadioListTile<Status>(
            //         groupValue: _status,
            //         onChanged: (value) => print(value),
            //         value: const Status(id: 0, name: "New"),
            //         withBorder: false,
            //         title: S.of(context).newProduct,
            //       ),
            //     ),
            //     const SizedBox(width: 8),
            //     Flexible(
            //       child: CustomRadioListTile<Status>(
            //         withBorder: false,
            //         groupValue: _status,
            //         onChanged: (value) => print(value),
            //         value: const Status(id: 1, name: "USED"),
            //         title: S.of(context).usedProduct,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
