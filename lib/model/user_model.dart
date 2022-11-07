class Usuario{

  var _id, _email, _nombre, _celular, _password;

  Usuario(this._id, this._email, this._nombre, this._celular, this._password);

  Usuario.fromJson(Map<String, dynamic> data):
        _id = data['id'],
        _nombre = data['nombre'],
        _celular = data['celular'],
        _email = data['email'],
        _password = data['password'];

  Map<String, dynamic> convert() => {
    'id': _id,
    'nombre': _nombre,
    'celular': _celular,
    'email': _email,
    'password': _password
  };

  get password => _password;
  set password(value) {_password = value;}

  get celular => _celular;
  set celular(value) {_celular = value;}

  get nombre => _nombre;
  set nombre(value) {_nombre = value;}

  get email => _email;
  set email(value) {_email = value;}

  get id => _id;
  set id(value) {_id = value;}
}