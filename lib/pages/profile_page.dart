// ignore_for_file: prefer_const_constructors

import 'package:e_wallet/blocs/auth/auth_bloc.dart';
import 'package:e_wallet/shared/shared_method.dart';
import 'package:e_wallet/shared/theme.dart';
import 'package:e_wallet/widgets/button.dart';
import 'package:e_wallet/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomeSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 22,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? AssetImage('assets/img_profile.png')
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_edit_profile.png',
                        title: 'Edit Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_pin.png',
                        title: 'My Pin',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit-pin');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_wallet.png',
                        title: 'Wallet Setting',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_help.png',
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: 'assets/icon_logout.png',
                        title: 'Log Out',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 87,
                ),
                CustomeTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
