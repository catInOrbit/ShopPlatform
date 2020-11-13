class User {
  String _gender, name, _address, _email, _username, _phoneNumber, _shopID, _documentReference, _avatarPicURL;

  get address => _address;

  get avatarPicURL => _avatarPicURL;

  set avatarPicURL(value) {
    _avatarPicURL = value;
  }

  get documentReference => _documentReference;

  set documentReference(value) {
    _documentReference = value;
  }

  get shopID => _shopID;

  set shopID(value) {
    _shopID = value;
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
  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }


  User(this._gender, this.name, this._address, this._email, this._username,
      this._phoneNumber, this._shopID,
      this._avatarPicURL);


  User.fromJson(Map<String, dynamic> json) {
    _shopID = json['shopID'];
    _gender = json['gender'];
    name = json['name'];
    _address = json['address'];
    _email = json['email'];
    _username = json['username'];
    _phoneNumber = json['phoneNumber'];

    _avatarPicURL = json['avatarPicURL'];

  }

  Map<String, dynamic> toJson() => _UserToJson(this);

}

Map<String, dynamic> _UserToJson(User instance) => <String, dynamic> {
  'gender' : instance.gender,
  'name' : instance.name,
  "address" : instance.address,
  'email' : instance.email,
  'username' : instance.username,
  'phoneNumber' : instance.phoneNumber,
  'shopID' : instance._shopID,
  'documentReference' : instance.documentReference,
  'avatarPicURL' : instance.avatarPicURL,
};

