class Product_Catalog {
  int? _pid;
  String? _pname;
  String? _category;
  String? _brand;
  String? _description;
  double? _price;
  int? available;
  String? _updateStatus;
  String img = "";

  Product_Catalog(
    this._pid,
    this._pname,
    this._category,
    this._brand,
    this._description,
    this._price,
    this.available,
    this._updateStatus
    );
}