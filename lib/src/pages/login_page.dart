import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_domain_module/school_domain_module.dart';
import 'package:school_presentation_module/src/blocs/bloc.dart';
import 'package:school_presentation_module/src/di/injection_container.dart'
    as di;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final loginBloc = di.inject<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                TextField(
                  controller: usernameC,
                ),
                TextField(
                  controller: passwordC,
                ),
                ElevatedButton(
                  onPressed: () {
                    loginBloc.add(
                      RequestLoginEvent(
                        LoginBodyEntity(usernameC.text, passwordC.text),
                      ),
                    );
                  },
                  child: Text("Login"),
                )
              ],
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator();
                } else if (state is LoginFailure) {
                  return Text(state.message);
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
