import 'package:hive/hive.dart';

part 'poi_local_model.g.dart';

@HiveType(typeId: 0)
class LocalPoi extends HiveObject{

  @HiveField(0)
  String? nombre;

  @HiveField(1)
  String? foto;

  @HiveField(2)
  String? ciudad;

  @HiveField(3)
  String? departamento;

  @HiveField(4)
  String? descripcion;

  @HiveField(5)
  String? temperatura;

  @HiveField(6)
  String? id;

  @HiveField(7)
  String? latitud;

  @HiveField(8)
  String? longitud;
}