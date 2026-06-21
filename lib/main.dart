import 'dart:ui';

import 'package:crafty_bay/Screens/splash_screen.dart';
import 'package:crafty_bay/Screens/sign_in.dart';
import 'package:crafty_bay/app/colors.dart';
import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/app/themedata.dart';
import 'package:crafty_bay/firebase_options.dart';
import 'package:crafty_bay/provider/localization_provider.dart';
import 'package:crafty_bay/provider/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';


//firebase set up
//Crashlytics set up
// Analytic set up
//localization set up
//Architecture design
//theme setup




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //firebase setup this and next line
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LocalizationProvider()..loadSavedLocale()),
        ChangeNotifierProvider(create: (_)=> Themeprovider()..loadSavedtheme())
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context, LocalizationProvider, _) {

          return Consumer<Themeprovider>(
            builder: (BuildContext context, Themeprovider , _) {
            return MaterialApp(
              title: 'Crafty Bay',
              onGenerateRoute: Routes.onGenerateRoute ,
              initialRoute:  SplashScreen.name,
              theme: Themedata.lightTheme,
              darkTheme: Themedata.darkTheme,
              themeMode: Themeprovider.theme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
            
              supportedLocales: AppLocalizations.supportedLocales,
              locale: LocalizationProvider.local,
            
            
            );}
          );
        }
      ),
    );
  }
}

