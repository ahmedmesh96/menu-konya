import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menu/controller/language_change_controller.dart';
import 'package:menu/generated/l10n.dart';
import 'package:menu/menu_screen.dart';
import 'package:menu/splash_screen.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

String language = "en";
void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString("language_code") ?? "";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD7JAsIVdHkjLOxxSleI6WUXKSfdVRHHz4",
          authDomain: "menu-4b80b.firebaseapp.com",
          projectId: "menu-4b80b",
          storageBucket: "menu-4b80b.appspot.com",
          messagingSenderId: "47349468916",
          appId: "1:47349468916:web:6a7b905caa25dcc84898a1"));

  runApp(MyApp(
    locale: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController())
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          if (locale.isEmpty) {
            provider.changeLanguage(const Locale("en"));
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale == ""
                ? const Locale("en")
                : provider.appLocale == null
                    ? Locale("en")
                    : provider.appLocale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Konya',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
