// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/shared/shared_method.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == '123123') {
        Navigator.pop(context, true);
      } else {
        showCustomeSnackbar(
            context, 'PIN yang anda masukans salah, silahkan coba lagi.');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha Pin',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  cursorColor: greyColor,
                  obscuringCharacter: '*',
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomeInputButton(
                    title: '1',
                    onTap: () {
                      addPin('1');
                    },
                  ),
                  CustomeInputButton(
                    title: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  CustomeInputButton(
                    title: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  CustomeInputButton(
                    title: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  CustomeInputButton(
                    title: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  CustomeInputButton(
                    title: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  CustomeInputButton(
                    title: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  CustomeInputButton(
                    title: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  CustomeInputButton(
                    title: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  CustomeInputButton(
                    title: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
