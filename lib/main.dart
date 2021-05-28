import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:the_voice/splash/splash_screen.dart';
import 'dart:async';

import 'package:the_voice/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runZonedGuarded(() {
    runApp(
      EasyLocalization(
          supportedLocales: [
            Locale('en'),
            Locale('fa'),
          ],
          path:
              'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('fa'),
          child: MyApp()),
    );
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    recordFlutterError(
        FlutterErrorDetails(exception: error, stack: stackTrace));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('fa'));
    return MaterialApp(
      title: 'The Voice',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SplashScreen.route:(context)=>SplashScreen()
      },
      initialRoute: SplashScreen.route,
     
    );
  }
}
