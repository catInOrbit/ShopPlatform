class User {
  String _gender, name, _address, _email, _username, _phoneNumber, _shopID, _documentReference, _avatarPicURL;

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }


  User(this._gender, this.name, this._address, this._email, this._username,
      this._phoneNumber, this._shopID,
      this._avatarPicURL);


  User.fromJson(Map<String, dynamic> json) {
    _gender = json['gender'];
    name = json['name'];
    _address = json['address'];
    _email = json['email'];
    _username = json['username'];
    _phoneNumber = json['phoneNumber'];
    _shopID = json['shopID'];
    _documentReference  = json['documentReference'];
    _avatarPicURL = json['avatarPicURL'];
  }
 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this._gender;
    data['name'] = this.name;
    data['address'] = this._address;
    data['email'] = this._email;
    data['username'] = this._username;
    data['phoneNumber'] = this._phoneNumber;
    data['shopID'] = this._shopID;
    data['documentReference'] = this._documentReference;
    data['avatarPicURL'] = this._avatarPicURL;
    return data;
  }

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
}

