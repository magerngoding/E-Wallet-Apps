// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/models/sign_in_form_model.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:e_wallet/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/shared_method.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomeSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img_logo_light.png'),
                  ),
                ),
              ),
              Text(
                'Sign In &\nGrow Your Finance',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Note : EMAIL INPUT
                    CustomeFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Note : PASSWORD INPUT
                    CustomeFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: blueTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomeFilledButton(
                      title: 'Sign In',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomeSnackbar(
                              context, 'Semua Filed Harus Diisi!');
                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomeTextButton(
                      title: 'Create New Account',
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
