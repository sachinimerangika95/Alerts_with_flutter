import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color.fromARGB(255, 224, 145, 67),
        title: Text('Flutter Mobile Application', 
        ),
        leading: const Icon(
          Icons.menu, 
          color: Color.fromARGB(255, 10, 10, 10), 
          size:24,
          ),
          actions:const [
            Icon(Icons.search, color:Color.fromARGB(255, 12, 12, 12), size:20),
            SizedBox(width: 10,),
            Icon(Icons.add, color:Color.fromARGB(255, 7, 7, 7), size:20),
            SizedBox(width: 10,),
            Icon(Icons.person, color:Color.fromARGB(255, 9, 9, 9), size:20),
            SizedBox(width: 10,),
          ],
      ),
   body: const Center(
     child: Text(
      'HOME SCREEN', 
     style: TextStyle(
      color: Color.fromARGB(255, 8, 8, 8),
      fontSize: 30,
      fontWeight: FontWeight.w700,
     ),),
   ),
    );
  }
}