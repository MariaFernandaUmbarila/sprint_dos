import 'package:hive/hive.dart';
import 'package:sprint_dos/model/poi_local_model.dart';

class Boxes{
  static Box<LocalPoi> getFavoritosBox() => Hive.box<LocalPoi>('favoritos');
}