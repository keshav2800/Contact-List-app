import 'package:contacts_app/home_page.dart';
import 'package:contacts_app/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contacts_app/login_or_register_page.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData) {
            return HomePage();
          }

          //user is not logged in
          else{
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}