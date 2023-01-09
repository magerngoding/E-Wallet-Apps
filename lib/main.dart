// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/blocs/auth/user/user_bloc.dart';
import 'package:e_wallet/pages/data_package_page.dart';
import 'package:e_wallet/pages/data_provider_page.dart';
import 'package:e_wallet/pages/data_success_page.dart';
import 'package:e_wallet/pages/home_page.dart';
import 'package:e_wallet/pages/onboarding_page.dart';
import 'package:e_wallet/pages/pin_page.dart';
import 'package:e_wallet/pages/profile_edit_page.dart';
import 'package:e_wallet/pages/profile_edit_pin_page.dart';
import 'package:e_wallet/pages/profile_edit_success_page.dart';
import 'package:e_wallet/pages/profile_page.dart';
import 'package:e_wallet/pages/sign_in_page.dart';
import 'package:e_wallet/pages/sign_up_page.dart';
import 'package:e_wallet/pages/splash_page.dart';
import 'package:e_wallet/pages/sign-up-success-page.dart';
import 'package:e_wallet/pages/topup_page.dart';
import 'package:e_wallet/pages/topup_success.dart';
import 'package:e_wallet/pages/transfer_page.dart';
import 'package:e_wallet/pages/transfer_success_page.dart';

import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        if (host == 'bwabank.my.id') {
          return true;
        } else {
          return false;
        }
      };
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              AuthGetCurrentUser(),
            ),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplahPage(),
          '/onboarding': (context) => OnBoardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-up-success': (context) => SignUpSuccessPage(),
          '/home': (context) => HomePage(),
          '/profile': (context) => ProfilePage(),
          '/pin': (context) => PinPage(),
          '/profile-edit': (context) => ProfileEditPage(),
          '/profile-edit-pin': (context) => ProfileEditPinPage(),
          '/profile-edit-success': (context) => ProfileEditSuccessPage(),
          '/topup': (context) => TopupPage(),
          '/topup-success': (context) => TopupSuccessPage(),
          '/transfer': (context) => TransferPage(),
          '/transfer-success': (context) => TransferSuccessPage(),
          '/data-provider': (context) => DataProviderPage(),
          '/data-success': (context) => DataSuccessPage(),
        },
      ),
    );
  }
}
