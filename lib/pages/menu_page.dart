import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sprint_dos/pages/favorites_page.dart';
import 'package:sprint_dos/pages/listpoi_page.dart';
import 'package:sprint_dos/pages/login_page.dart';

class MenuPage extends StatelessWidget{

  String URL = "https://firebasestorage.googleapis.com/v0/b/mobiletech-180de.appspot.com/o/avatardefault_92824.png?alt=media&token=466410fc-c27d-4872-a82f-b8be5c8ac5f6";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: Image.network(URL)
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_pin, size: 30, color: Colors.black,),
                title: Text(
                    (FirebaseAuth.instance.currentUser?.email).toString(),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                ,
                textColor: Colors.black,
              ),
              ListTile(
                leading: const Icon(Icons.not_listed_location, size: 30, color: Colors.black),
                title: const Text(
                    "Sitios turísticos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                ,
                textColor: Colors.black,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPoiPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.star, size: 30, color: Colors.black),
                title: const Text(
                    "Favoritos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                ,
                textColor: Colors.black,
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FavoritePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.blue),
                title: const Text("Exit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                textColor: Colors.blue,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}