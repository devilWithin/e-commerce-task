import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudex_test/core/utils/asset_manager.dart';
import 'package:fudex_test/core/widgets/widgets.dart';
import 'package:fudex_test/features/product/domain/entites/category.dart';
import 'package:fudex_test/features/product/domain/entites/size.dart';
import 'package:fudex_test/features/product/domain/entites/status.dart';
import 'package:fudex_test/generated/l10n.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Status? _status;
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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.2,
                    height: 121,
                    child: DottedBorder(
                      color: Colors.grey.withOpacity(0.2),
                      dashPattern: const [10, 5],
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      strokeWidth: 2,
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
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 8,
                        height: 51,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          color: Colors.grey.withOpacity(0.2),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 3],
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
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 8,
                        height: 51,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          color: Colors.grey.withOpacity(0.2),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 3],
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
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 8,
                        height: 51,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          color: Colors.grey.withOpacity(0.2),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 3],
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
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 8,
                        height: 51,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          color: Colors.grey.withOpacity(0.2),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 3],
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
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 8,
                        height: 51,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2,
                          color: Colors.grey.withOpacity(0.2),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 3],
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
                        ),
                      ),
                    ],
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
            RequiredTextHeadline(headline: S.of(context).mainCategory),
            CustomDropDownMenu<Category>(
              itemBuilder: (value) => Text(value.name),
              onTap: (value) => print(value),
              withBorder: true,
              title: S.of(context).mainCategory,
              options: const [
                Category(id: 1, name: "سشسش"),
                Category(id: 2, name: "سشسش"),
                Category(id: 3, name: "ثضصثضصثضص"),
              ],
            ),
            const SizedBox(height: 8),
            RequiredTextHeadline(headline: S.of(context).secondaryCategory),
            CustomDropDownMenu<Category>(
              itemBuilder: (value) => Text(value.name),
              onTap: (value) => print(value),
              withBorder: true,
              title: S.of(context).mainCategory,
              options: const [
                Category(id: 1, name: "سشسشsadas"),
                Category(id: 2, name: "سشسش"),
                Category(id: 3, name: "ثضصثضصثضص"),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: TextEditingController(),
              label: S.of(context).rsa,
              headline: S.of(context).productPrice,
            ),
            const SizedBox(height: 8),
            RequiredTextHeadline(headline: S.of(context).addons),
            CustomDropDownMenu<Category>(
              itemBuilder: (value) => Text(value.name),
              onTap: (value) => print(value),
              withBorder: true,
              title: S.of(context).mainCategory,
              options: const [
                Category(id: 1, name: "سشسشsadas"),
                Category(id: 2, name: "سشسش"),
                Category(id: 3, name: "ثضصثضصثضص"),
              ],
            ),
            const SizedBox(height: 8),
            RequiredTextHeadline(headline: S.of(context).specifyColor),
            CustomDropDownMenu<Color>(
              itemBuilder: (value) => Container(
                width: 20,
                height: 20,
                color: value,
              ),
              onTap: (value) => print(value),
              withBorder: true,
              title: S.of(context).mainCategory,
              options: const [
                Colors.red,
                Colors.blue,
                Colors.green,
              ],
            ),
            const SizedBox(height: 8),
            RequiredTextHeadline(headline: S.of(context).specifySize),
            CustomDropDownMenu<SizeEntity>(
              itemBuilder: (value) => Text(value.name),
              onTap: (value) => print(value),
              withBorder: true,
              title: S.of(context).mainCategory,
              options: const [
                SizeEntity(id: 0, name: 'XS'),
                SizeEntity(id: 1, name: 'S'),
                SizeEntity(id: 2, name: 'M'),
                SizeEntity(id: 3, name: 'L'),
                SizeEntity(id: 4, name: 'XL'),
                SizeEntity(id: 5, name: '2XL'),
                SizeEntity(id: 6, name: '3XL'),
              ],
            ),
            const SizedBox(height: 8),
            RequiredTextHeadline(headline: S.of(context).productStatus),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomRadioListTile<Status>(
                    groupValue: _status,
                    onChanged: (value) => print(value),
                    value: const Status(id: 0, name: "New"),
                    withBorder: false,
                    title: S.of(context).newProduct,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: CustomRadioListTile<Status>(
                    withBorder: false,
                    groupValue: _status,
                    onChanged: (value) => print(value),
                    value: const Status(id: 1, name: "USED"),
                    title: S.of(context).usedProduct,
                  ),
                ),
              ],
            ),
            RequiredTextHeadline(headline: S.of(context).specifySize),
            CustomDropDownMenu<SizeEntity>(
              itemBuilder: (value) => Text(value.name),
              onTap: (value) => print(value),
              withBorder: true,
              title: S.of(context).mainCategory,
              options: const [
                SizeEntity(id: 0, name: 'XS'),
                SizeEntity(id: 1, name: 'S'),
                SizeEntity(id: 2, name: 'M'),
                SizeEntity(id: 3, name: 'L'),
                SizeEntity(id: 4, name: 'XL'),
                SizeEntity(id: 5, name: '2XL'),
                SizeEntity(id: 6, name: '3XL'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
