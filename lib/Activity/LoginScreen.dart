import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/ConstClass/AllConst.dart';
import 'package:flutter_app/ConstClass/ColorConst.dart';
import 'package:flutter_app/ConstClass/FontConst.dart';
import '../models/choice.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget{


  LoginScreenState createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen>  {

  final _formkey=GlobalKey<FormState>();

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  Widget _buildloginbutton() {
    return Container(


        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Text('Login',style: TextStyle(color: Colors.black,fontSize: 15.0)),
          color: Colors.white,
    onPressed: () {
      if (_formkey.currentState.validate()) {
        _formkey.currentState.save();
        // use the email provided here
        print('valid');
      }else{
        print('not valid');
      }

      // print(email.text);
      //       print(password.text);
            // print(passwordController.text);
          },
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.sad,
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        child: Form(
          key: _formkey,
          child: Column(

            children: <Widget>[

              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,80.0,20.0,0),
                  child: Text('Test Demo',style: TextStyle(fontSize: 30,color: Colors.blue, fontWeight: FontWeight.bold, fontFamily: FontConstant.boldFont)),
                ),
              ),
          Container(
            alignment: Alignment.center,
            child: Padding(

              padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: 'Enter Email'
                ),

                validator: (email) {
                  if (isEmailValid(email))
                    return null;
                  else
                    return 'Enter a valid email address';
                },
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,
            child: Padding(

              padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: 'Enter Password'
                ),

                maxLength: 6,
                obscureText: true,
                validator: (password) {
                  if (isPasswordValid(password)) return null;
                  else
                    return 'Enter a valid password';
                },
              ),
            ),
          ),
             _buildloginbutton()
            ],
          ),
        ),
      ),

    );

  }


  static bool isEmailValid(String email) {

    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);

  }

  bool isPasswordValid(String password) => password.length == 6;
}



