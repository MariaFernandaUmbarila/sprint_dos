import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/model/poi_model.dart';
import 'package:sprint_dos/pages/menu_page.dart';
import 'package:sprint_dos/pages/poi_page.dart';

class ListPoiPage extends StatefulWidget {
  const ListPoiPage({Key? key}) : super(key: key);

  @override
  State<ListPoiPage> createState() => _ListPoiPageState();
}

class _ListPoiPageState extends State<ListPoiPage> {

  List sitios = [];
  List<dynamic> idDoc=[];
  late Message msg;
  final buscar = TextEditingController();

  @override
  void initState(){
    super.initState();
    getSitios();
  }

  Future getSitios() async{
    String id = "";
    QuerySnapshot sitio = await FirebaseFirestore.instance.collection("Sitios").get();
    setState(() {
      if(sitio.docs.isNotEmpty){
        for(var i in sitio.docs){
          id = i.id;
          idDoc.add(id);
          sitios.add(i.data());
        }
      }else{
        msg.showMessage("No se encontraron sitios");
      }
    });
  }

  Future getCiudad() async{
    idDoc.clear();
    sitios.clear();
    String id = "";
    QuerySnapshot ciudad = await FirebaseFirestore.instance.collection("Sitios").where("ciudad", isEqualTo: buscar.text).get();
    setState(() {
      if(ciudad.docs.isNotEmpty){
        for(var i in ciudad.docs){
          id = i.id;
          idDoc.add(id);
          sitios.add(i.data());
        }
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
      drawer: MenuPage(),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 30, right: 0),
                    child: TextFormField(
                      controller: buscar,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "Ciudad",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
              ),
              IconButton(
                  onPressed: (){
                    setState(() {getCiudad();});
                  },
                  padding: const EdgeInsets.only(top: 10, right: 50, left: 10),
                  icon: const Icon(Icons.search, size: 50, color: Colors.deepPurple)
              )
            ]
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                child: ListView.builder(
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
                                      sitios[i]["departamento"], sitios[i]["descripcion"], sitios[i]["temperatura"], idDoc[i],
                                      sitios[i]["latitud"], sitios[i]["longitud"]);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PoiPage(newPoi)));
                                },
                              )
                          )
                        ],
                      );
                    }
                ),
              ),
          )
        ],
      )
    );
  }
}