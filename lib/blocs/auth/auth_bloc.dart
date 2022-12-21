import 'package:e_wallet/models/sign_in_form_model.dart';
import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/services/auth_service.dart';
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
            print('Auth From Login');

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
      },
    );
  }
}
