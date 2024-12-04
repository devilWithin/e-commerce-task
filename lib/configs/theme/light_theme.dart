import 'package:flutter/material.dart';
import 'package:fudex_test/core/utils/app_colors.dart';

ThemeData getLightThemeData(BuildContext context) => ThemeData(
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
    );
