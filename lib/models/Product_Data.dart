
class ProductData{

  static final ProductData _item_instance = ProductData._internal();
  factory ProductData() => _item_instance;
  ProductData._internal();

  List<ItemData> Items = [
    ItemData (
      1, "Intern Set", "Dress", "Hazel Clothing", 
      "A comfortable set for office wear.", 
      ["S","M","L","XL"], "White, Brown", 33500, 50, 5, "New Arrival", 
      [
        "image/hazelintern1.jpg","image/hazelintern2.jpg","image/hazelintern3.jpg","image/hazelintern4.jpg","image/hazelintern5.jpg"
      ]
    ),
    ItemData (
      2, "Linen Puff Blouse", "Tops", "PLA Clothing", 
      "A comfortable top for everyday wear.", 
      ["S","M","L","XL"], "White", 31500, 20, 4, "New Arrival", 
      [
        "image/plalinen1.jpg","image/plalinen2.jpg","image/plalinen3.jpg","image/plalinen4.jpg","image/plalinen5.jpg"
      ]
    ),
    ItemData (
      3, "Heather Dress", "Dress", "Hazel Clothing", 
      "A comfortable top for everyday wear.", 
      ["S","M","L","XL"], "Blue, Black", 19500, 30, 3, "New Arrival", 
      [
        "image/hazeldress1.jpg","image/hazeldress2.jpg","image/hazeldress3.jpg","image/hazeldress4.jpg","image/hazeldress5.jpg"
      ]
    ),
    ItemData (
      4, "Ribbon Chquered Top", "Tops", "PLA Clothing", 
      "A comfortable top for everyday wear.", 
      ["S","M","L","XL"], "Pink, Orange, Yellow", 26500, 25, 3, "New Arrival", 
      [
        "image/plaribbon2.jpg","image/plaribbon1.jpg","image/plaribbon3.jpg","image/plaribbon4.jpg","image/plaribbon5.jpg"
      ]
    ),
  ];

}

class ItemData {
  int id = 0;
  String name = "";
  String category = "";
  String brand = "";
  String description = "";
  List<String> sizes = [];
  String color = "";
  double price = 0;
  int available = 0;
  int rating = 0;
  String updateStatus = "";
  List<String> images = [];

  ItemData(
    this.id,
    this.name,
    this.category,
    this.brand,
    this.description,
    this.sizes,
    this.color,
    this.price,
    this.available,
    this.rating,
    this.updateStatus,
    this.images
    );
}