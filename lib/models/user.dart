class User {
  int? _userid;
  String? _username;
  String? _useremail;
  String? _useraddress;
  String? _phno;

  User(
    this._userid, 
    this._username, 
    this._useremail, 
    this._useraddress, 
    this._phno
    );

  User.map(dynamic obj){
    this._userid = obj['userid'];
    this._username = obj['username'];
    this._useremail = obj['useremail'];
    this._useraddress = obj['useraddress'];
    this._phno = obj['phno'];
  }
  int? get userid => _userid;
  String? get username => _username;
  String? get useremail => _useremail;
  String? get useraddress => _useraddress;
  String? get phno => _phno;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['userid'] = _userid;
    map['username'] = _username;
    map['useremail'] = _useremail;
    map['useraddress'] = _useraddress;
    map['phno'] = _phno;
    return map;
  }
}