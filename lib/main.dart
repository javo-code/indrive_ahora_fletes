import 'package:ahora_fletes/src/presentation/pages/auth/login/Login_Page.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Event.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/Register_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(LoginInitEvent()),
      child: MaterialApp(
        title: "Flutter Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        initialRoute: "login",
        routes: {
          "login": (BuildContext context) => LoginPage(),
          "register": (BuildContext context) => RegisterPage(),
        },
      ),
    );
  }
}
