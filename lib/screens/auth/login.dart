import 'package:bell_app/screens/auth/register.dart';
import 'package:bell_app/screens/auth/widgets/bg_widget.dart';
import 'package:bell_app/screens/auth/widgets/button_auth.dart';
import 'package:bell_app/screens/auth/widgets/input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size _size;

  TextEditingController password = new TextEditingController();
  TextEditingController username = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          HeaderWave(),
          content(),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo(),
          form(),
        ],
      ),
    );
  }

  Widget btnImage(String path) {
    return Image.asset(path, height: 30.0);
  }

  Widget logo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bell App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget linkRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: Text(
            "Create",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget form() {
    return Container(
      width: _size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Login into your account",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          InputAuth("Email / Username", username, Icons.person),
          InputAuth("Password", password, Icons.lock, isPassword: true),
          SizedBox(
            height: 15.0,
          ),
          ButtonAuth("Login"),
          SizedBox(
            height: 40.0,
          ),
          linkRegister(),
        ],
      ),
    );
  }
}