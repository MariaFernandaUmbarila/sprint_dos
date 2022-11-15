// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:sprint_dos/classes/boxes.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/model/poi_local_model.dart';
import 'package:sprint_dos/model/poi_model.dart';
import 'package:sprint_dos/pages/menu_page.dart';

class PoiPage extends StatefulWidget {
  final POIData poiData;

  PoiPage(this.poiData);

  @override
  State<PoiPage> createState() => _PoiPageState();
}

class _PoiPageState extends State<PoiPage> {

  late Message msg;
  bool isFavorito = false;

  @override
  void initState() {
    getLocalSitio();
    super.initState();
  }

  void getLocalSitio(){
    final box = Boxes.getFavoritosBox();
    box.values.forEach((element) {
      if(element.id == widget.poiData.id){
        isFavorito = true;
      }
    });
  }

  void favoritoPresionado() async{
    var localPoi = LocalPoi()
    ..nombre = widget.poiData.nombre
    ..foto = widget.poiData.foto
    ..descripcion = widget.poiData.descripcion
    ..ciudad = widget.poiData.ciudad
    ..departamento = widget.poiData.departamento
    ..temperatura = widget.poiData.temperatura
    ..id = widget.poiData.id;

    final box = Boxes.getFavoritosBox();

    if(isFavorito){
      box.delete(localPoi.id);
      msg.showMessage("El sitio ya se encuentra en favoritos");
    }else{
      box.put(localPoi.id, localPoi);
      msg.showMessage("Agregado con éxito a favoritos");
    }

    setState(() {
      isFavorito = !isFavorito;
    });

  }

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Detalle del sitio turístico",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: MenuPage(),
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
                Row(
                  children: [
                    Expanded(
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: Icon(isFavorito ? Icons.favorite : Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {
                            favoritoPresionado();
                          },
                        )
                    )
                  ],
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