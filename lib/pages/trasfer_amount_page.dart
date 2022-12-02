// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_build_context_synchronously

import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({super.key});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 58),
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                cursorColor: greyColor,
                enabled: false,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
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
                  addAmount('1');
                },
              ),
              CustomeInputButton(
                title: '2',
                onTap: () {
                  addAmount('2');
                },
              ),
              CustomeInputButton(
                title: '3',
                onTap: () {
                  addAmount('3');
                },
              ),
              CustomeInputButton(
                title: '4',
                onTap: () {
                  addAmount('4');
                },
              ),
              CustomeInputButton(
                title: '5',
                onTap: () {
                  addAmount('5');
                },
              ),
              CustomeInputButton(
                title: '6',
                onTap: () {
                  addAmount('6');
                },
              ),
              CustomeInputButton(
                title: '7',
                onTap: () {
                  addAmount('7');
                },
              ),
              CustomeInputButton(
                title: '8',
                onTap: () {
                  addAmount('8');
                },
              ),
              CustomeInputButton(
                title: '9',
                onTap: () {
                  addAmount('9');
                },
              ),
              SizedBox(
                width: 60,
                height: 60,
              ),
              CustomeInputButton(
                title: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
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
          SizedBox(
            height: 50,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/transfer-success', (route) => false);
              }
            },
          ),
          SizedBox(
            height: 25,
          ),
          CustomeTextButton(
            title: 'Terms & Condition',
            onPressed: () {},
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
