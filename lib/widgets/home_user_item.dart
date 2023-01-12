import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;
  HomeUserItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: EdgeInsets.only(
        right: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: user.profilePicture == null
                      ? const AssetImage(
                          'assets/img_profile.png',
                        )
                      : NetworkImage(user.profilePicture!) as ImageProvider),
            ),
          ),
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
