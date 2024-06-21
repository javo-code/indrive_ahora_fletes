import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_Bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_Event.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_State.dart';
import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';
import 'package:ahora_fletes/src/presentation/widgets/default_button.dart';
import 'package:ahora_fletes/src/presentation/widgets/default_text_field_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;
  const RegisterContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            color: Color.fromARGB(255, 255, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
            margin: EdgeInsets.only(
              left: 60,
              bottom: 35,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: const [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 122, 122, 122),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _banner(context),
                  DefaultTextFieldOutlined(
                    text: "Firstname",
                    icon: Icons.person_2_outlined,
                    margin: EdgeInsets.only(left: 50, right: 50),
                    onChanged: (text) {
                      context.read<RegisterBloc>().add(FirstNameChanged(
                          firstName: BlocFormItem(value: text)));
                    },
                    validator: (value) {
                      return state.firstName.error;
                    },
                  ),
                  DefaultTextFieldOutlined(
                    text: "Lastname",
                    icon: Icons.person_2_outlined,
                    margin: EdgeInsets.only(top: 15, left: 50, right: 50),
                    onChanged: (text) {
                      context.read<RegisterBloc>().add(
                          LastNameChanged(lastName: BlocFormItem(value: text)));
                    },
                    validator: (value) {
                      return state.lastName.error;
                    },
                  ),
                  DefaultTextFieldOutlined(
                    text: "Email",
                    icon: Icons.email_outlined,
                    margin: EdgeInsets.only(top: 15, left: 50, right: 50),
                    onChanged: (text) {
                      context
                          .read<RegisterBloc>()
                          .add(EmailChanged(email: BlocFormItem(value: text)));
                    },
                    validator: (value) {
                      return state.email.error;
                    },
                  ), // e // elemento  importado desde default_text_field.dart
                  DefaultTextFieldOutlined(
                    text: "Phone",
                    icon: Icons.phone_android_outlined,
                    margin: EdgeInsets.only(top: 15, left: 50, right: 50),
                    onChanged: (text) {
                      context
                          .read<RegisterBloc>()
                          .add(PhoneChanged(phone: BlocFormItem(value: text)));
                    },
                    validator: (value) {
                      return state.phone.error;
                    },
                  ),
                  // elemento  importado desde default_text_field.dart
                  DefaultTextFieldOutlined(
                      text: "Password",
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 15, left: 50, right: 50),
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.password.error;
                      }),
                  DefaultTextFieldOutlined(
                    text: "Repeat Password",
                    icon: Icons.lock_outline,
                    margin: EdgeInsets.only(top: 15, left: 50, right: 50),
                    onChanged: (text) {
                      context.read<RegisterBloc>().add(ConfirmPasswordChanged(
                          confirmPassword: BlocFormItem(value: text)));
                    },
                    validator: (value) {
                      return state.confirmPassword.error;
                    },
                  ),
                  DefaultButton(
                    text: "Create Account",
                    margin: EdgeInsets.only(
                      top: 30,
                      left: 60,
                      right: 60,
                    ),
                    onPressed: () {
                      if (state.formKey!.currentState!.validate()) {
                        context.read<RegisterBloc>().add(FormSubmit());
                        context.read<RegisterBloc>().add(FormReset());
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  _alreadyHaveAccount(context),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          //_imageBackgrouund(context)
        ],
      ),
    );
  }

/*   Widget _imageBackgrouund(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/img/registerBackground.png',
          width: 355,
          height: 355,
        ));
  } */

  Widget _banner(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/img/register.png',
          width: 355,
          height: 355,
        ));
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
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
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
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _alreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Log ",
          style: TextStyle(
            color: Color.fromARGB(255, 197, 197, 197),
            fontSize: 17,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'login');
          },
          child: Text(
            "in!",
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
