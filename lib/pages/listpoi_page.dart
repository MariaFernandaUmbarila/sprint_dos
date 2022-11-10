import 'package:flutter/material.dart';

class ListPoiPage extends StatefulWidget {
  const ListPoiPage({Key? key}) : super(key: key);

  @override
  State<ListPoiPage> createState() => _ListPoiPageState();
}

class _ListPoiPageState extends State<ListPoiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Listado de sitios turísticos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}