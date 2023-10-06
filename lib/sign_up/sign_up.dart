import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onbording_screen/component/my_button.dart';
// import 'package:onbording_screen/component/my_iconbutton.dart';
import 'package:onbording_screen/component/my_textbutton.dart';
import 'package:onbording_screen/component/my_textfield.dart';
import 'package:onbording_screen/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final sexController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  

  createUserWithEmailAndPassword() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if(e.code == 'invalid-email'){
        print('No user found for that email.');

      }else if(e.code == 'INVALID_LOGIN_CREDENTIALS'){
        print('Wrong password provide for that user');
      }
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
              "Welcome to our community!",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Text(
                "To get started, please provide your information and create an account.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MytextField(
              controller: nameController,
              hintText: 'Enter your name',
              obscureText: false,
              labelText: "Name",
            ),

            const SizedBox(
              height: 30,
            ),

            MytextField(
              controller: emailController,
              hintText: 'Enter your Email',
              obscureText: false,
              labelText: "Email",
            ),

            const SizedBox(
              height: 30,
            ),

            MytextField(
              controller: sexController,
              hintText: 'Male or Female',
              obscureText: false,
              labelText: "Sex",
            ),

            const SizedBox(
              height: 30,
            ),

            MytextField(
              controller: ageController,
              hintText: 'Enter your Age',
              obscureText: false,
              labelText: "Age",
            ),

            const SizedBox(
              height: 30,
            ),

            MytextField(
              controller: passwordController,
              hintText: 'Enter a password',
              obscureText: true,
              labelText: "password",
            ),

            const SizedBox(
              height: 40,
            ),

            MyButton(hintText: 'Sign up', onTap: createUserWithEmailAndPassword),
            const SizedBox(
              height: 25,
            ),

             Padding(
               padding: const EdgeInsets.symmetric(horizontal:25.0),
               child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
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

             const SizedBox(height: 20,),
            const SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const MyTextButton(labelText: "Sign in", pageRoute: 'login',),
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