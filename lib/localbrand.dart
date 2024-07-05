import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'database_helper.dart';
import 'dart:io';

class Localbrand extends StatefulWidget {
  @override
  _LocalbrandPageState createState() => _LocalbrandPageState();
}

class _LocalbrandPageState extends State<Localbrand> {
  final List<LocalbrandItem> services = [];
  String searchText = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _serviceController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadServices();
  }

  Future<void> _loadServices() async {
    final LocalbrandData = await DatabaseHelper.instance.getLocalbrand();
    setState(() {
      services.clear();
      LocalbrandData.forEach((brand_localbrand) {
         services.add(LocalbrandItem(
          id: brand_localbrand['id'],
          name: brand_localbrand['name_localbrand'],
          service: brand_localbrand['brand_localbrand'],
          imagePath: brand_localbrand['imagePath_localbrand'], 
          price: brand_localbrand['price_localbrand'],
          description: brand_localbrand['description_localbrand'],
        ));
      });
    });
  }

  Future<void> _addServiceToDatabase(String name, String brand, double price, String description, String imagePath) async {
    Map<String, dynamic> LocalbrandData = {
      'name_localbrand': name,
      'brand_localbrand': brand,
      'price_localbrand': price,
      'description_localbrand': description,
      'imagePath_localbrand': imagePath,
    };
    await DatabaseHelper.instance.insertLocalbrand(LocalbrandData);
    _loadServices();
  }

  Future<void> _deleteLocalbrandFromDatabase(int id) async {
    await DatabaseHelper.instance.deleteLocalbrand(id);
    _loadServices();
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addServiceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Add New Product",
            style: TextStyle(color: Color(0xFF4C53A5)),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  style: TextStyle(color: Color(0xFF4C53A5)),
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(color: Color(0xFF4C53A5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _serviceController,
                  style: TextStyle(color: Color(0xFF4C53A5)),
                  decoration: InputDecoration(
                    labelText: 'Brand Name',
                    labelStyle: TextStyle(color: Color(0xFF4C53A5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _priceController,
                  style: TextStyle(color: Color(0xFF4C53A5)),
                  decoration: InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(color: Color(0xFF4C53A5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  style: TextStyle(color: Color(0xFF4C53A5)),
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Color(0xFF4C53A5)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4C53A5)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                _image == null
                    ? Text('', style: TextStyle(color: Colors.white))
                    : Image.file(_image!),
              ],
            ),
          ),
          actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF4C53A5),
            ),
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4C53A5), 
              foregroundColor: Colors.white, 
            ),
              child: Text("Add"),
              onPressed: () async {
                if (_nameController.text.isNotEmpty &&
                    _serviceController.text.isNotEmpty &&
                    _priceController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty &&
                    _image != null) {
                  double price = double.parse(_priceController.text);
                  await _addServiceToDatabase(
                    _nameController.text,
                    _serviceController.text,
                    price,
                    _descriptionController.text,
                    _image!.path,
                  );
                  _nameController.clear();
                  _serviceController.clear();
                  _priceController.clear();
                  _descriptionController.clear();
                  _image = null;
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredServices = searchText.isEmpty
        ? services
        : services
            .where((item) => item.service.toLowerCase().contains(searchText.toLowerCase()))
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Local Brands',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        )
        ),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
             
              decoration: InputDecoration(
                labelText: 'Search by Brand',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final item = filteredServices[index];
                return Container(
                  color: Colors.white10,
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(item.imagePath)),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      '${item.service} - Price : ${item.price.toString()} Kyats',
                      style: TextStyle(color: Colors.black54),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await _deleteLocalbrandFromDatabase(item.id);
                        setState(() {
                          services.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailsPage(item: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'To add new product, click this button ',
            style: TextStyle(
              fontSize: 15.0,
              color: Color(0xFF4C53A5),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _addServiceDialog,
            tooltip: 'Add Product',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class ItemDetailsPage extends StatelessWidget {
  final LocalbrandItem item;
  const ItemDetailsPage({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
      ),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(item.imagePath)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),),
            SizedBox(height: 15),
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Brand: ${item.service}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              'Price: ${item.price}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              item.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class LocalbrandItem {
  final int id;
  final String name;
  final String service;
  final String imagePath;
  final double price;
  final String description;
  LocalbrandItem({
    required this.id,
    required this.name,
    required this.service,
    required this.imagePath,
    required this.price,
    required this.description,
  });
}
