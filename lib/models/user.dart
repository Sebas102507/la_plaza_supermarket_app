class User{

  String _email;
  String _password;
  String _id;

  User(this._email, this._password);
  User.usuarioExistente(this._email,this._id);

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}