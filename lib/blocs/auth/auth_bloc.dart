import 'package:bloc/bloc.dart';
import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/services/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        // TODO: implement event handler

        if (event is AuthCheckEmail) {
          try {
            emit(AuthLoading());

            final res = await AuthService().checkEmail(event.email);

            if (res == false) {
              emit(AuthCheckEmailSuccess());
            } else {
              emit(AuthFailed('Email Sudah Terpakai!'));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
      },
    );
  }
}
