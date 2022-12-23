import 'dart:math';

import 'package:e_wallet/models/sign_in_form_model.dart';
import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/models/user_edit_form_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/services/auth_service.dart';
import 'package:e_wallet/services/user_service.dart';
import 'package:e_wallet/services/wallet_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmail) {
          try {
            emit(AuthLoading());

            final res = await AuthService().checkEmail(event.email);

            if (res == false) {
              emit(AuthCheckEmailSuccess());
            } else {
              emit(AuthFailed('Email Sudah Dipakai'));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthRegister) {
          try {
            print('Auth From Register');

            emit(AuthLoading());

            final user = await AuthService().register(event.data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthLogin) {
          try {
            emit(AuthLoading());

            final user = await AuthService().login(event.data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
        if (event is AuthGetCurrentUser) {
          try {
            emit(AuthLoading());

            final SignInFormModel data =
                await AuthService().getCredentialFormLocal();

            final UserModel user = await AuthService().login(data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthUpdateUser) {
          try {
            if (state is AuthSuccess) {
              final updateUser = (state as AuthSuccess).user.copyWith(
                  username: event.data.username,
                  name: event.data.name,
                  email: event.data.email,
                  password: event.data.password);

              emit(AuthLoading());

              await UserService().updateUser(event.data);

              emit(AuthSuccess(updateUser));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthUpdatePin) {
          try {
            if (state is AuthSuccess) {
              final updateUser = (state as AuthSuccess).user.copyWith(
                    pin: event.newPin,
                  );

              emit(AuthLoading());

              await WalletService().updatePin(
                event.oldPin,
                event.newPin,
              );

              emit(AuthSuccess(updateUser));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
      },
    );
  }
}
