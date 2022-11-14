import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/model/poi_model.dart';
import 'package:sprint_dos/pages/poi_page.dart';

class ListPoiPage extends StatefulWidget {
  const ListPoiPage({Key? key}) : super(key: key);

  @override
  State<ListPoiPage> createState() => _ListPoiPageState();
}

class _ListPoiPageState extends State<ListPoiPage> {

  List sitios = [];
  late Message msg;

  @override
  void initState(){
    super.initState();
    getSitios();
  }

  Future getSitios() async{
    QuerySnapshot sitio = await FirebaseFirestore.instance.collection("Sitios").get();
    setState(() {
      if(sitio.docs.isNotEmpty){
        for(var i in sitio.docs){
          sitios.add(i.data());
        }
      }else{
        msg.showMessage("No se encontraron sitios");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              "Sitios turísticos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)
          ),
          backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: sitios.length,
          itemBuilder: (BuildContext context, i){
            return Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(sitios[i]["foto"]),
                      radius: 50,
                    )
                ),
                Expanded(
                    child: ListTile(
                      title: Text(
                          sitios[i]["nombre"],
                          style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600)
                      ),
                      subtitle: Text(
                          sitios[i]["ciudad"] + " - " + sitios[i]["departamento"],
                          style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)
                      ),
                      onTap: (){
                        POIData newPoi = POIData(sitios[i]["nombre"], sitios[i]["foto"], sitios[i]["ciudad"],
                            sitios[i]["departamento"], sitios[i]["descripcion"], sitios[i]["temperatura"]);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PoiPage(newPoi)));
                      },
                    )
                )
              ],
            );
          }
      ),
    );
  }
}