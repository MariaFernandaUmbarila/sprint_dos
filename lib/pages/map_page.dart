// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sprint_dos/classes/message_class.dart';
import 'package:sprint_dos/classes/tokens.dart';
import 'package:latlong2/latlong.dart';
import 'package:sprint_dos/model/poi_model.dart';


class MapPage extends StatefulWidget {
  final POIData poiData;

  MapPage(this.poiData);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  late Message msg;

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Mapa del sitio",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 17,
              center: LatLng(double.parse(widget.poiData.latitud), double.parse(widget.poiData.longitud))
            ),
            nonRotatedChildren: [
              TileLayer(
                urlTemplate: AppConstants.mapBoxTemplate,
                additionalOptions: const {
                  'accessToken': AppConstants.mapBoxAccessToken,
                  'id': AppConstants.mapBoxId
                },
              ),
            ],
          ),
        ],
      ),
    );
  }


}