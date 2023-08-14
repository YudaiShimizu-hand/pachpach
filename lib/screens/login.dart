import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:pachpach/components/appBar.dart';
import 'package:pachpach/components/button.dart';
import 'package:pachpach/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarCmp(isBtn: 'beforeLogin'),
      body: Container(
        margin: const EdgeInsets.all(50),
        width: 300,
        height: 550,
        // color: Color(KbaseColor),
        decoration: BoxDecoration(
          color: Color(KbaseColor),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Color(KbaseColor).withOpacity(0.5),
              offset: Offset(20, 20),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'ログイン',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'メールアドレス',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
                onChanged: (value){
                  email = value;
                },
              ),
            ),
            KSpace,
            const Text(
              'パスワード',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 200,
              height: 30,
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
                onChanged: (value){
                  password = value;
                },
              ),
            ),
            KSecondSpace,
            ButtonCmp(clickHand: ()async{
              try{
                final loginUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                if(loginUser != null){
                  Navigator.pushNamed(context, "/");
                }
              }catch(e){
                print(e);
              }
            }, txt: 'ログイン', mt: 5),
            KSpace,
            TextButton(onPressed: (){Navigator.pushNamed(context, '/signin');}, child: Text("新規登録"))
          ],
        ),
      ),
    );
  }
}
