import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudex_test/core/utils/base_state.dart';
import 'package:fudex_test/features/product/domain/entites/product.dart';
import 'package:fudex_test/features/product/presentation/cubit/get_all_products_cubit.dart';
import 'package:fudex_test/features/product/presentation/widgets/product_item.dart';
import 'package:fudex_test/injection_container.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final _getAllProductsCubit = sl<GetAllProductsCubit>();

  @override
  void initState() {
    super.initState();
    _getAllProductsCubit.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetAllProductsCubit, BaseState<List<Product>>>(
        bloc: _getAllProductsCubit,
        builder: (context, state) {
          if (state.isSuccess) {
            if (state.item == null || state.item!.isEmpty) {
              return const Center(
                child: Text('No products found'),
              );
            }
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ProductItem(
                product: state.item![index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: state.item!.length,
            );
          }
          if (state.isFailure) {
            return const Center(
              child: Text('Failed to load products'),
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
