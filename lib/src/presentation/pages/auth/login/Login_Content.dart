import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Event.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_State.dart';
import 'package:ahora_fletes/src/presentation/widgets/default_button.dart';
import 'package:ahora_fletes/src/presentation/widgets/default_text_field.dart';

class LoginContent extends StatelessWidget {
  final LoginState state;

  const LoginContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 255, 0, 0),
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // HORIZONTAL
              mainAxisAlignment: MainAxisAlignment.center, // VERTICAL
              children: [
                _textLoginRotated(context),
                SizedBox(
                  height: 100,
                ),
                _textRegisterRotated(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, bottom: 40),
            decoration: BoxDecoration(
              //color: const Color.fromARGB(255, 255, 255, 255),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: const [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 122, 122, 122),
                  ]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(),
                    _mainTitle("Ahora"),
                    _mainTitle("Fletes"),
                    _imageTruck(),
                    _textLoginMain(),
                    DefaultTextField(
                        onChanged: (text) {
                          context.read<LoginBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                        text: "Email",
                        icon: Icons
                            .email_outlined), // elemento  importado desde default_text_field.dart
                    DefaultTextField(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                      text: "Password",
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ), // elemento  importado desde default_text_field.dart
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    DefaultButton(
                      text: "LOGIN",
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        } else {
                          print("The form is not valid");
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    _separatorOr(),
                    SizedBox(height: 20),
                    _haveNotAccount(context),
                    SizedBox(height: 50)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _mainTitle(String text) {
    return Text(text,
        style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 12, 12),
            fontWeight: FontWeight.bold));
  }

  Widget _imageTruck() {
    return Container(
        alignment: Alignment.topRight,
        child: Image.asset(
          'assets/img/flete2.png',
          width: 220,
          height: 220,
        ));
  }

  Widget _textLoginMain() {
    return Text('Log in',
        style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold));
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "login",
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text("Login",
            style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          'register',
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Color.fromARGB(255, 255, 255, 255),
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          "Or",
          style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        Container(
          width: 25,
          height: 1,
          color: Color.fromARGB(255, 255, 255, 255),
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _haveNotAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Join us today!",
          style: TextStyle(
            color: Color.fromARGB(255, 197, 197, 197),
            fontSize: 17,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
