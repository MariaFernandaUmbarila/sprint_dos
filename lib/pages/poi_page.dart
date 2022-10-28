// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';

class PoiPage extends StatefulWidget {
  const PoiPage({Key? key}) : super(key: key);

  @override
  State<PoiPage> createState() => _PoiPageState();
}

class _PoiPageState extends State<PoiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Detalle del sitio turístico",
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
                const Text(
                    "Biblioteca Pública Virgilio Barco",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)
                ),
                Container(
                  child: Image.asset("assets/images/poi.jpg", width: 300, height: 300),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  margin: const EdgeInsets.all(1),
                ),
                const Text(
                    "Ciudad: Bogotá",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 20),
                const Text(
                    "Departamento: Cundinamarca",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 20),
                const Text(
                    "Temperatura: de 7°C a 20°C",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 20),
                const Text(
                    "Descripción: La Biblioteca Pública Virgilio Barco está ubicada en la localidad de Teusaquillo, "
                        "rodeada de parques y complejos deportivos y recreativos, atiende a los habitantes de las "
                        "localidades de Teusaquillo, Chapinero, Engativá, Barrios Unidos, Los Mártires y Puente Aranda. "
                        "Fue diseñada por el arquitecto Rogelio Salmona y se inauguró el 20 de diciembre de 2001. "
                        "En 2007 fue declarada Bien de Interés Cultural Nacional y debe su nombre al expresidente "
                        "colombiano Virgilio Barco Vargas",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}