import 'package:evalora/frontend/pages/loginpg.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets',
      supportedLocales: [
        Locale('en'),
        Locale('hi'),
        Locale('bn'),
        Locale('gu'),
        Locale('kn'),
        Locale('ml'),
        Locale('mr'),
        Locale('ne'),
        Locale('pa'),
        Locale('ta'),
        Locale('ur'),
      ],
      fallbackLocale: Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; // Fallback to the first supported locale
      },
      home: LoginScreen(),
    );
  }
}

// Function to translate text dynamically using Google Translator
Future<String> translateText(BuildContext context, String text) async {
  final translator = GoogleTranslator();
  final localeCode =
      Localizations.localeOf(context).languageCode; // Get locale code

  if (localeCode != 'en') {
    // Assuming English is the default language
    try {
      final translation = await translator.translate(text, to: localeCode);
      return translation.toString();
    } catch (e) {
      print("Translation error: $e");
      return text; // Fallback to the original text in case of an error
    }
  }
  return text; // Return the original text if the locale is English
}
