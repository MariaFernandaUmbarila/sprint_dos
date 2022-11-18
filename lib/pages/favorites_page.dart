import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sprint_dos/classes/boxes.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/model/poi_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sprint_dos/model/poi_model.dart';
import 'package:sprint_dos/pages/menu_page.dart';
import 'package:sprint_dos/pages/poi_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  late Message msg;

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Tus sitios turísticos favoritos",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: MenuPage(),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: ValueListenableBuilder<Box<LocalPoi>>(
              valueListenable: Boxes.getFavoritosBox().listenable(),
              builder: (context, box, _){
                final poiBox = box.values.toList().cast<LocalPoi>();
                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: poiBox.length,
                    itemBuilder: (BuildContext context, i){
                      return Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(poiBox[i].foto.toString()),
                                radius: 50,
                              )
                          ),
                          Expanded(
                              child: ListTile(
                                title: Text(
                                    poiBox[i].nombre.toString(),
                                    style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600)
                                ),
                                subtitle: Text(
                                    "${poiBox[i].ciudad} - ${poiBox[i].departamento}",
                                    style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)
                                ),
                                onTap: (){
                                  POIData newPoi = POIData(poiBox[i].nombre.toString(), poiBox[i].foto.toString(), poiBox[i].ciudad.toString(),
                                      poiBox[i].departamento.toString(), poiBox[i].descripcion.toString(), poiBox[i].temperatura.toString(), poiBox[i].id.toString(),
                                      poiBox[i].latitud.toString(), poiBox[i].longitud.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PoiPage(newPoi)));
                                },
                                onLongPress: (){
                                  setState(() {
                                    msg.showMessage("Sitio eliminado de favoritos con éxito");
                                    poiBox[i].delete();
                                  });
                                }
                              )
                          )
                        ],
                      );
                    }
                );
              }
          )
      )
    );
  }
}