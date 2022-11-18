// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:e_wallet/pages/onboarding_page.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/onboarding', (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          width: 155,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img_logo_dark.png'),
            ),
          ),
        ),
      ),
    );
  }
}
