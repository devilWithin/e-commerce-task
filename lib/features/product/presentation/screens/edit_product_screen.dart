import 'package:flutter/material.dart';
import 'package:fudex_test/core/widgets/scaffold_with_title.dart';
import 'package:fudex_test/generated/l10n.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithTitle(
        title: S.of(context).editProduct,
        body: Column(
          children: [],
        ));
  }
}
