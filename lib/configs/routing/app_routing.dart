import 'package:flutter/material.dart';
import 'package:fudex_test/configs/routing/routes.dart';
import 'package:fudex_test/core/utils/app_strings.dart';
import 'package:fudex_test/features/product/presentation/screens/add_product_screen.dart';
import 'package:fudex_test/features/product/presentation/screens/edit_product_screen.dart';
import 'package:fudex_test/features/product/presentation/screens/products_list_screen.dart';

class AppRouting {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.productsScreen:
        return _customPageRoute(
          const ProductsListScreen(),
        );
      case Routes.addProductScreen:
        return _customPageRoute(
          const AddProductScreen(),
        );
      case Routes.editProductScreen:
        return _customPageRoute(
          const EditProductScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
