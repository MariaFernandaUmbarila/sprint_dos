class LocalModel{
  String _id = "", _direccion = "", _foto = "", _telefono = "";
  double _latitud = 0.0, _longitud = 0.0;

  LocalModel();

  get longitud => _longitud;
  set longitud(value) {_longitud = value;}

  double get latitud => _latitud;
  set latitud(double value) {_latitud = value;}

  get telefono => _telefono;
  set telefono(value) {_telefono = value;}

  get foto => _foto;
  set foto(value) {_foto = value;}

  get direccion => _direccion;
  set direccion(value) {_direccion = value;}

  String get id => _id;
  set id(String value) {_id = value;}
}