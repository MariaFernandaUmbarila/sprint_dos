// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:sprint_dos/pages/poi_page.dart';
import 'package:sprint_dos/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

  void validUser(){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      if (email.text == "test@gmail.com" && password.text == "1234") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoiPage()));
      } else {
        showMessage("Datos incorrectos");
      }
    }else{
      showMessage("Se requieren todos los datos para ingresar");
    }
  }

  void showMessage(String msg){
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
      content: Text(msg, style: const TextStyle(fontSize: 18)),
      backgroundColor: const Color(0xFFFF9800),
      duration: const Duration(seconds: 7),
      action: SnackBarAction(
        label: "OK",
        onPressed: screen.hideCurrentSnackBar,
      ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
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
