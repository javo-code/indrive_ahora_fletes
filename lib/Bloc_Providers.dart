import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Event.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blockProviders = [
  BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(RegisterInitEvent())),
];
