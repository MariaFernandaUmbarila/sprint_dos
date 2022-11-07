// ignore_for_file: sort_child_properties_last, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/model/user_model.dart';
import 'package:sprint_dos/pages/login_page.dart';
import 'package:sprint_dos/repository/user_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  final password_repeat = TextEditingController();
  final nombre = TextEditingController();
  final celular = TextEditingController();

  late Message msg;
  UserRegister userRegister = UserRegister();

  void saveUser(Usuario newUser) async{
    String? result = await userRegister.registerUser(email.text, password.text);

    if(result == "invalid-email"){
      msg.showMessage("Ingrese un email válido");
    }else if(result == "weak-password"){
      msg.showMessage("La cotraseña debe tener mínimo 6 dígitos");
    }else if(result == "unknown"){
      msg.showMessage("Complete todos los datos");
    }else if(result == "network-request-failed"){
      msg.showMessage("No se encontró conexión a Internet");
    }else{
      newUser.id = result;
      registerUserId(newUser);
      msg.showMessage("Se creó el nuevo usuario");
    }
  }

  void bringData(){
    setState(() {
      bool formNotEmpty = email.text.isNotEmpty && password.text.isNotEmpty &&
      password_repeat.text.isNotEmpty && nombre.text.isNotEmpty && celular.text.isNotEmpty;

      if(password_repeat.text == password.text){
        if(formNotEmpty){
          var newUser = Usuario("", email.text, nombre.text, celular.text, password.text);
          saveUser(newUser);
        }else{
          msg.showMessage("Complete todos los datos");
        }
      }else{
        msg.showMessage("Las contraseñas deben ser iguales");
      }
    });
  }

  void registerUserId(Usuario newUser) async{
    var id = await userRegister.createUser(newUser);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
                  controller: nombre,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 24)),
                ),
                const SizedBox(height: 30),
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
                  controller: celular,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                      labelText: "Celular",
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
                    onPressed: () {bringData();},
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