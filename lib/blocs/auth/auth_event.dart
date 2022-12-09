part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;
  AuthCheckEmail(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];
}
