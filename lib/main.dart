import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:resume/data.dart';
import 'package:resume/myhomepage.dart';
import 'package:resume/theme/theme.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: AdaptiveTheme(
        light: lightThemeDefault,
        dark: darkThemeDefault,
        initial: AdaptiveThemeMode.dark,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Resume',
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: [
            Locale('en', ''), // English, no country code
          ],
          // supportedLocales:
          //     AppLocalizations.supportedLocales, // English, no country code

          theme: theme,
          darkTheme: darkTheme,
          home: MyHomePage(),
        ),
      ),
    );
  }
}
