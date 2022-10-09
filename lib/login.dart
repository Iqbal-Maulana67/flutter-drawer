import 'package:flutter/material.dart';
import 'package:flutter_drawer/home.dart';
import 'package:flutter_drawer/main.dart';
import 'package:flutter_drawer/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> setSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100.0, bottom: 100.0),
              child: Text(
                'PINK',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Catenaccio',
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Input Username",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white),
                controller: emailController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Input Password",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                ),
                controller: passwordController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0),
              child: MaterialButton(
                  minWidth: double.infinity,
                  textColor: Colors.white,
                  height: 50.0,
                  color: Colors.pinkAccent[400],
                  onPressed: () {
                    setSharedPreferences();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text("LOGIN")),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                'Belum memiliki akun?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: const Text("Daftar!"),
              ),
            )
            // Text(
            //   'Daftar!',
            //   style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 12,
            //       decoration: TextDecoration.underline),
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.pink[600],
    );
  }
}
