part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailed extends AuthState {
  final String e;
  AuthFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => [e];
}

class AuthCheckEmailSuccess extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}
