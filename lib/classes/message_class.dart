import 'package:flutter/material.dart';

class Message{

  late BuildContext context;
  Message(this.context);

  void showMessage(String msg){
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
        content: Text(msg, style: const TextStyle(fontSize: 18)),
        backgroundColor: const Color(0xFF8C7FD9),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: "OK",
          textColor: Colors.white,
          onPressed: screen.hideCurrentSnackBar,
        ),
      )
    );
  }
}