part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginException extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity loginEntity;

  LoginSuccess(this.loginEntity);
}
