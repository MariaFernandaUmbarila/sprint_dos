// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:sprint_dos/model/poi_model.dart';

class PoiPage extends StatefulWidget {
  final POIData poiData;

  PoiPage(this.poiData);

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
                Text(
                    widget.poiData.nombre,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)
                ),
                Container(
                  child: Image.network(widget.poiData.foto, width: 300, height: 300),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  margin: const EdgeInsets.all(1),
                ),
                Text(
                    "Ciudad: ${widget.poiData.ciudad}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 20),
                Text(
                    "Departamento: ${widget.poiData.departamento}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 20),
                Text(
                    "Temperatura: ${widget.poiData.temperatura}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
                const SizedBox(height: 20),
                Text(
                    "Descripción: ${widget.poiData.descripcion}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}