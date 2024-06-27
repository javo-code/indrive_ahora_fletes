import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Event.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_State.dart';
import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';
import 'package:ahora_fletes/src/presentation/widgets/Default_Button.dart';
import 'package:ahora_fletes/src/presentation/widgets/Default_Text_Field_Outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            color: Colors.red,
            padding: EdgeInsets.only(left: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //HORIZONTAL
                mainAxisAlignment: MainAxisAlignment.center, //VERTICAL
                children: [
                  _textLoginRotated(),
                  SizedBox(height: 100),
                  _textRegisterRotated(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                ]),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 60,
              bottom: 35,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    _textWelcome("Indrive"),
                    _textWelcome("App"),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                    _imageTruck(),
                    DefaultTextFieldOutlined(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                            EmailChanged(email: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.email.error;
                      },
                      text: "Email",
                      icon: Icons.email_outlined,
                    ),
                    DefaultTextFieldOutlined(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                      text: "Password",
                      icon: Icons.lock_outline,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    DefaultButton(
                      text: "LOGIN",
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) ;
                        context.read<LoginBloc>().add(FormSubmit());
                      },
                    ),
                    _separetorOR(),
                    SizedBox(height: 10),
                    _tesxDontHaveAccount(context),
                    SizedBox(height: 50)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tesxDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Have Account?",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 17,
          ),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "register");
          },
          child: Text(
            "Sign Up!",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _separetorOR() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 1,
          color: Colors.black,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          "Or",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 50,
          height: 1,
          color: Colors.black,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _imageTruck() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/img/truck_no_bg.png",
        width: 250,
        height: 250,
      ),
    );
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "register");
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          "Sign Up!",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 178, 173),
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
