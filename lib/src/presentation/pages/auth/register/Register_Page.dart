import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/Register_Content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(), // Aquí se crea el RegisterBloc
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return RegisterContent(
                state); // Aquí se muestra el contenido de Register
          },
        ),
      ),
    );
  }
}
