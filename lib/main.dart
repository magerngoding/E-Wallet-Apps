// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/pages/onboarding_page.dart';
import 'package:e_wallet/pages/sign_in_page.dart';
import 'package:e_wallet/pages/sign_up_page.dart';
import 'package:e_wallet/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnBoardingPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
