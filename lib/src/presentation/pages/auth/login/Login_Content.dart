import 'package:ahora_fletes/src/presentation/widgets/Default_Button.dart';
import 'package:ahora_fletes/src/presentation/widgets/Default_Text_Field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                _textRegisterRotated(),
                SizedBox(height: 90),
              ]),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 60,
            bottom: 60,
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
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/truck_no_bg.png",
                    width: 250,
                    height: 250,
                  ),
                ),
                DefaultTextField(
                  text: "Email",
                  icon: Icons.email_outlined,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                ),
                DefaultTextField(
                  text: "Password",
                  icon: Icons.lock_outline,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                ),
                Spacer(),
                DefaultButton(text: "LOGIN"),
                Row(
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
                ),
                SizedBox(height: 10),
                Row(
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
                    Text(
                      "Sing in!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ],
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

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
