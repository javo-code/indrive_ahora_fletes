import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blockProviders = [
  BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(LoginInitEvent())),
];
