import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onbording_screen/component/my_button.dart';
import 'package:onbording_screen/component/my_iconbutton.dart';
import 'package:onbording_screen/component/my_textbutton.dart';
import 'package:onbording_screen/component/my_textfield.dart';
// import 'package:onbording_screen/onboarding/on_boarding.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // void signInUser() async {
  //   if (emailController.text != "" && passwordController.text != "") {
  //     print('Well Done.');
  //   } else {
  //     print('Please input your email and password.');
  //   }
  // }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog('Login successfully.');
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if(e.code == 'invalid-email'){
        _showMyDialog('No user found for that email.');
      }else if(e.code == 'invalid-login-credentials'){
        _showMyDialog('Wrong password provide for that user');
      }
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
            child: Column(
          children: [
            const Spacer(),
            Text(
              "Hello, Ready to Get Started?",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Please sign in with your Email and Password",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MytextField(
              controller: emailController,
              hintText: 'Enter your email',
              obscureText: false,
              labelText: "Email",
            ),
            const SizedBox(
              height: 30,
            ),
            MytextField(
              controller: passwordController,
              hintText: 'Enter your password',
              obscureText: true,
              labelText: "Password",
            ),
            const SizedBox(
              height: 25,
            ),
            const MyTextButton(
              labelText: "forgot password?",
              pageRoute: 'forgot',
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(hintText: 'Sign in', onTap: signInWithEmailAndPassword),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(
                  imagePath: 'assets/images/google.png',
                ),
                SizedBox(
                  width: 10,
                ),
                MyIconButton(imagePath: 'assets/images/apple.png')
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const MyTextButton(
                    labelText: "Register now",
                    pageRoute: 'register',
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}
