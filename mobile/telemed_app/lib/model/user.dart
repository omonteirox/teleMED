class User {
  String? _email;
  String? _name;
  String? _number;
  String? _password;
  String? _profilePicture;
  List<String>? _roles;
  String? _status;
  String? _username;

  User(
      {String? email,
      String? name,
      String? number,
      String? password,
      String? profilePicture,
      List<String>? roles,
      String? status,
      String? username}) {
    if (email != null) {
      _email = email;
    }
    if (name != null) {
      _name = name;
    }
    if (number != null) {
      _number = number;
    }
    if (password != null) {
      _password = password;
    }
    if (profilePicture != null) {
      _profilePicture = profilePicture;
    }
    if (roles != null) {
      _roles = roles;
    }
    if (status != null) {
      _status = status;
    }
    if (username != null) {
      _username = username;
    }
  }

  String? get email => _email;
  set email(String? email) => _email = email;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get number => _number;
  set number(String? number) => _number = number;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get profilePicture => _profilePicture;
  set profilePicture(String? profilePicture) =>
      _profilePicture = profilePicture;
  List<String>? get roles => _roles;
  set roles(List<String>? roles) => _roles = roles;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get username => _username;
  set username(String? username) => _username = username;

  User.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _name = json['name'];
    _number = json['number'];
    _password = json['password'];
    _profilePicture = json['profilePicture'];
    _roles = json['roles'].cast<String>();
    _status = json['status'];
    _username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = _email;
    data['name'] = _name;
    data['number'] = _number;
    data['password'] = _password;
    data['profilePicture'] = _profilePicture;
    data['roles'] = _roles;
    data['status'] = _status;
    data['username'] = _username;
    return data;
  }
}
