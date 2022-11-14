// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/pages/listpoi_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sprint_dos/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  late Message msg;

  void validUser() async{
    try {
      final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ListPoiPage()));
      }
    }on FirebaseAuthException catch(e){
      if(e.code == "invalid-email"){
        msg.showMessage("Ingrese un email válido");
      }
      if(e.code == "user-not-found"){
        msg.showMessage("El ususario ingresado no existe");
      }
      if(e.code == "wrong-password"){
        msg.showMessage("La contraseña es incorrecta");
      }
      if(e.code == "unknown"){
        msg.showMessage("Complete todos los datos");
      }
      if(e.code == "network-request-failed"){
        msg.showMessage("No se encontró conexión a Internet");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(image: AssetImage("assets/images/logo.png"), width: 150, height: 150),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 24)
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: password,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.key_rounded, color: Colors.blue, size: 24)
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    onPressed: () {validUser();},
                    child: const Text("Iniciar sesión")
                ),
                const SizedBox(height: 30),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w700)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Regístrate")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
