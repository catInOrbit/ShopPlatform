class User {
  String _gender, name, _address, _email, _username, _phoneNumber, _cartID, _documentReference, _avatarPicURL;

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  User(this._gender, this.name, this._address, this._email, this._username,
      this._phoneNumber, this._cartID,
      this._avatarPicURL);

  Map<String, dynamic> toJson() => _UserToJson(this);

  User.fromJson(Map<String, dynamic> json) {
    _cartID = json['cartID'];
    _gender = json['gender'];
    name = json['name'];
    _address = json['address'];
    _email = json['email'];
    _username = json['username'];
    _phoneNumber = json['phoneNumber'];
    _cartID = json['cartID'];
    _documentReference  = json['documentReference'];
    _avatarPicURL = json['avatarPicURL'];
  }


  Map<String, dynamic> _UserToJson(User instance) => <String, dynamic> {
    'gender' : instance.gender,
    'name' : instance.name,
    "address" : instance.address,
    'email' : instance.email,
    'username' : instance.username,
    'phoneNumber' : instance.phoneNumber,
    'cartID' : instance.cartID,
    'documentReference' : instance.documentReference,
    'avatarURL' : instance.avatarPicURL,
  };

  get address => _address;

  get avatarPicURL => _avatarPicURL;

  set avatarPicURL(value) {
    _avatarPicURL = value;
  }

  get documentReference => _documentReference;

  set documentReference(value) {
    _documentReference = value;
  }

  get cartID => _cartID;

  set cartID(value) {
    _cartID = value;
  }

  get phoneNumber => _phoneNumber;

  set phoneNumber(value) {
    _phoneNumber = value;
  }

  get username => _username;

  set username(value) {
    _username = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set address(value) {
    _address = value;
  }
}

