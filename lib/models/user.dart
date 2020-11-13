class ShopUser {
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


  ShopUser(this._gender, this.name, this._address, this._email, this._username,
      this._phoneNumber, this._shopID,
      this._avatarPicURL);

  ShopUser.Internal();


  ShopUser UserFromJson(Map<String, dynamic> json) {

   var user = ShopUser(
        json['gender'] as String,
        json['name'] as String,
        json['address'] as String,
        json['email'] as String,
        json['username'] as String,
        json['phoneNumber'] as String,
        json['shopID'] as String,
        json['avatarPicURL'] as String
    );

   return user;


  }

  Map<String, dynamic> toJson() => _UserToJson(this);

}

Map<String, dynamic> _UserToJson(ShopUser instance) => <String, dynamic> {
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

