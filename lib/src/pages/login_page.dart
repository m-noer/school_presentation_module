import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_domain_module/school_domain_module.dart';
import 'package:school_presentation_module/src/blocs/bloc.dart';
import 'package:school_presentation_module/src/di/injection_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final loginBloc = inject<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: ListView(
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
        );
      },
    );
  }
}
