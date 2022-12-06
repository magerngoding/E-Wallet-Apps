// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:e_wallet/widgets/form.dart';
import 'package:e_wallet/widgets/transfer_rencet_user_item.dart';
import 'package:e_wallet/widgets/trasfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomeFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildResult(),
          SizedBox(
            height: 230,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            isVerified: true,
            name: 'Yonna Joe',
            username: 'yoenna',
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Siraj Hafizh',
            username: 'mhmmdsrjhafizh_',
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'Cahya',
            username: 'rcahyaoktvn',
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
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
              TrasferResultUserItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'Yonna Joe',
                username: 'yoenna',
                isVerified: true,
              ),
              TrasferResultUserItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Yonna',
                username: 'yoenna',
                isVerified: true,
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
