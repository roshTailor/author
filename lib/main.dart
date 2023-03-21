import 'package:author/Screens/RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/HomePage.dart';
import 'Screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        textTheme: TextTheme(
      bodyText2: GoogleFonts.acme(),
      bodyText1: GoogleFonts.acme(),
    )),
    routes: {
      '/': (context) => const Splash(),
      'HomePage': (context) => const HomePage(),
      'RegisterPage': (context) => const RegisterPage(),
    },
  ));
}
