import 'package:ahora_fletes/src/presentation/pages/auth/login/Login_Content.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, bloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return LoginContent(state);
        },
      ),
    );
  }
}
