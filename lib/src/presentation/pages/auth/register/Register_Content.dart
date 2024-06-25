import 'package:ahora_fletes/src/presentation/widgets/Default_Button.dart';
import 'package:ahora_fletes/src/presentation/widgets/Default_Text_Field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(),
              SizedBox(height: 100),
              _textRegisterRotated(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              _imageBanner(),
              DefaultTextField(
                text: "Firstname",
                icon: Icons.person_outlined,
                margin: EdgeInsets.only(left: 50, right: 50),
              ),
              DefaultTextField(
                text: "Lastname",
                icon: Icons.person_outlined,
                margin: EdgeInsets.only(top: 15, left: 50, right: 50),
              ),
              DefaultTextField(
                text: "Email",
                icon: Icons.email_outlined,
                margin: EdgeInsets.only(top: 15, left: 50, right: 50),
              ),
              DefaultTextField(
                text: "Phone",
                icon: Icons.phone_outlined,
                margin: EdgeInsets.only(top: 15, left: 50, right: 50),
              ),
              DefaultTextField(
                text: "Password",
                icon: Icons.lock_outlined,
                margin: EdgeInsets.only(top: 15, left: 50, right: 50),
              ),
              DefaultTextField(
                text: "Confirm password",
                icon: Icons.lock_outlined,
                margin: EdgeInsets.only(top: 15, left: 50, right: 50),
              ),
              DefaultButton(
                text: "Create Account",
                margin: EdgeInsets.only(
                  top: 30,
                  left: 60,
                  right: 60,
                ),
              ),
              SizedBox(height: 25),
              _separetorOR(),
              SizedBox(height: 10),
              _textAlreadyHaveAccount(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textAlreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Already have Account?",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(width: 5),
        Text(
          "Sign In!",
          style: TextStyle(
            color: Colors.red,
            fontSize: 17,
            fontWeight: FontWeight.bold,
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

  Widget _imageBanner() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/img/register.png",
        width: 300,
        height: 300,
      ),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 24,
          color: const Color.fromARGB(255, 255, 178, 173),
        ),
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Sign Up!",
        style: TextStyle(
          fontSize: 27,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
/*               
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: const [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 154, 154, 154),
            ],
          ),
 */
