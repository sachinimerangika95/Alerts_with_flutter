import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onbording_screen/login_sucess_page.dart';
import 'sign_in/sign_in.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>
      (stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext cotext, AsyncSnapshot<User?> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else{
          if(snapshot.hasData){
            return LoginSuccessPage();
          }else{
            return const SignInScreen();
          }
        }
      },),
    );
  }
}
