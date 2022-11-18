// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sprint_dos/classes/tokens.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
        title: const Text('Flutter MapBox'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: AppConstants.myLocation,
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