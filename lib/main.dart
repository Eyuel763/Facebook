import 'package:facebook/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CenteredFacebookLogoPage()
    );
  }
}

class CenteredFacebookLogoPage extends StatelessWidget {
  const CenteredFacebookLogoPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body:  Center(
        child:IconButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))}, icon: Icon(Icons.facebook, color: Color.fromARGB(31, 47, 164, 139),size: 25,))
      ),
    );
  }
}