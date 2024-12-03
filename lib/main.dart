import 'package:flutter/material.dart';
import 'package:fudex_test/configs/routing/app_routing.dart';
import 'package:fudex_test/core/utils/app_colors.dart';
import 'package:fudex_test/injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudex Demo',
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting.onGenerateRoute,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'Cairo',
        useMaterial3: false,
        badgeTheme: const BadgeThemeData(
          textColor: AppColors.badgeTextColor,
          backgroundColor: AppColors.badgeColor,
        ),
        dividerColor: AppColors.dividerColor,
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.badgeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          padding: EdgeInsets.zero,
          labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.badgeTextColor,
              ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.1),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontFamily: 'Cairo',
              ),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 13.0,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontSize: 10.0,
            color: Colors.black,
          ),
        ),
      ),
      // onGenerateRoute: AppRouting.onGenerateRoute,
    );
  }
}
