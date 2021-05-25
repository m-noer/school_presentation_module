import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:school_domain_module/school_domain_module.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.requestLogin) : super(LoginInitial());

  final RequestLogin requestLogin;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is RequestLoginEvent) {
      yield LoginLoading();
      final failureOrLogin = await requestLogin(event.body);
      yield* _eitherSuccessOrFailure(failureOrLogin);
    }
  }

  Stream<LoginState> _eitherSuccessOrFailure(
    Either<Failure, LoginEntity> failureOrLogin,
  ) async* {
    yield failureOrLogin.fold(
        (l) => LoginFailure("error"), (r) => LoginSuccess(r));
  }
}
