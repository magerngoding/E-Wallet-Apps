// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/bank_item.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset(
                      'assets/img_wallet.png',
                      width: 80,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BankItem(
            imageUrl: 'assets/img_bank_bca.png',
            title: 'BANK BCA',
            isSelected: true,
          ),
          BankItem(
            imageUrl: 'assets/img_bank_bni.png',
            title: 'BANK BNI',
          ),
          BankItem(
            imageUrl: 'assets/img_bank_mandiri.png',
            title: 'BANK MANDIRI',
          ),
          BankItem(
            imageUrl: 'assets/img_bank_ocbc.png',
            title: 'BANK OCBC',
          ),
          SizedBox(
            height: 12,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
