// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:e_wallet/widgets/form.dart';
import 'package:e_wallet/widgets/package_item.dart';
import 'package:e_wallet/widgets/trasfer_result_user_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paket Data'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Select Data',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomeFormField(
            title: '+628',
            isShowTitle: false,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              PackageItem(
                amount: 10,
                price: 100000,
              ),
              PackageItem(
                amount: 25,
                price: 200000,
              ),
              PackageItem(
                amount: 40,
                price: 400000,
              ),
              PackageItem(
                amount: 99,
                price: 1000000,
                isSelected: true,
              ),
            ],
          ),
          SizedBox(
            height: 85,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data-success', (route) => false);
              }
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
