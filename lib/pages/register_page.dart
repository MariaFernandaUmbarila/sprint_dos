// ignore_for_file: sort_child_properties_last, non_constant_identifier_names
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  final password_repeat = TextEditingController();

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
                      suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 24)),
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
                TextFormField(
                  controller: password_repeat,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                      labelText: "Repetir contraseña",
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
                    onPressed: () {},
                    child: const Text("Registrar")
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}