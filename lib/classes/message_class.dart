import 'package:flutter/material.dart';

class Message{

  late BuildContext context;
  Message(this.context);

  void showMessage(String msg){
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
        content: Text(msg, style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFF0A90C0),
        duration: const Duration(seconds: 7),
        action: SnackBarAction(
          label: "OK",
          onPressed: screen.hideCurrentSnackBar,
        ),
      )
    );
  }
}