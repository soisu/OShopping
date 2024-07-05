class Order {
  int? _odid;
  String? _odno;
  DateTime? _dateOrdered;
  String? _orderStatus;
  int? _userid;
  String? _paymentType;
  double? _totalPrice;
  int? _shipid;



  Order(
    this._odid, 
    this._odno, 
    this._dateOrdered, 
    this._orderStatus, 
    this._userid, 
    this._paymentType, 
    this._totalPrice, 
    this._shipid
    );
}