part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RequestLoginEvent extends LoginEvent {
  final LoginBodyEntity body;

  RequestLoginEvent(this.body);

  @override
  List<Object> get props => [body];
}
