// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:sprint_dos/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  //Override of the initState function
  @override
  void initState(){
    passPage();
    super.initState();
  }

  //Delay the splash page replacement for 3 seconds
  Future<void> passPage() async{
    Future.delayed(const Duration(seconds: 3), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Image(image: AssetImage("assets/images/logo.png"), width: 200, height: 200),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: const EdgeInsets.all(30),
        ),
      )
    );
  }
}