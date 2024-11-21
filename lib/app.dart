import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackify_tools/l10n/app_translations.dart';
import 'package:trackify_tools/view/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trackify Tools',
      theme: ThemeData(useMaterial3: false),
      themeMode: ThemeMode.light,
      translations: AppTranslations(),
      locale: Locale('en'),
      fallbackLocale: Locale("en"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('np', ''),
      ],
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
