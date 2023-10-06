import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onbording_screen/home_screen.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSuccessPage extends StatelessWidget {
   LoginSuccessPage({super.key});

  final user = FirebaseAuth.instance.currentUser;


  void signOutUser() async{
    await FirebaseAuth.instance.signOut();
    const MyApp();
  }
// Text('Hello,' + user!.email.toString(),)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 181, 212, 243),
        centerTitle: true,
        title: const Text('SHOP'),
        actions: [
          IconButton(
            onPressed: signOutUser, 
            icon: const Icon(Icons.login, size: 30,),
            )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // big logo
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset('assets/images/lopburi.jpg'),
            ),

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Welcome to My Travel Adventure',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),

            // groceree gives you fresh vegetables and fruits
            Text(
              'Embrace Wanderlust With Me!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 24),

            const Spacer(),

            // get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 45, 106, 205),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}