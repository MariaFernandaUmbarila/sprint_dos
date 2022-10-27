// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:sprint_dos/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

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
                  decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 24)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: password,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.key_rounded, color: Colors.blue, size: 24)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {},
                    child: const Text("Iniciar sesión")
                ),
                const SizedBox(height: 20),
                TextButton(
                    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 16, color: Colors.teal)),
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
