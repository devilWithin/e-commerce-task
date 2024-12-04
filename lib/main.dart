import 'package:flutter/material.dart';
import 'package:fudex_test/configs/routing/app_routing.dart';
import 'package:fudex_test/configs/theme/light_theme.dart';
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
      title: 'Fudex Test',
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
      theme: getLightThemeData(context),
      // onGenerateRoute: AppRouting.onGenerateRoute,
    );
  }
}
