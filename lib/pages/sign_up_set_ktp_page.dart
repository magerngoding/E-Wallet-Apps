// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/shared/shared_method.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetKtpPage({
    required this.data,
  });

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
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
                'Verify Your\nAccount',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(
                          () {
                            selectedImage = image;
                          },
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(selectedImage!.path),
                                  ),
                                ),
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                  'assets/icon_upload.png',
                                  width: 32,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Passport/ID Card',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomeFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data.copyWith(
                                    ktp: selectedImage == null
                                        ? null
                                        : 'data:image/png;base64,' +
                                            base64Encode(
                                              File(selectedImage!.path)
                                                  .readAsBytesSync(),
                                            ),
                                  ),
                                ),
                              );
                        } else {
                          showCustomeSnackbar(
                              context, 'Gambar tidak boleh kosong!');
                        }
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomeTextButton(
                      title: 'Skip for Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthRegister(
                                widget.data,
                              ),
                            );
                      },
                    )
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
