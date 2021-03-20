import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/screens/alert_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart' as cupertino;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
        headline1: GoogleFonts.pacifico(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      )),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es', 'ES'), // Hebrew
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      //home: HomeScreen()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertScreen());
      },
    );
  }
}
