import 'package:flutter/material.dart';
import 'package:online_shopping/dress.dart';
import 'package:online_shopping/hotitems.dart';
import 'package:online_shopping/localbrand.dart';
import 'package:online_shopping/models/Product_Data.dart';
import 'package:online_shopping/navbar.dart';
import 'package:online_shopping/pants.dart';
import 'package:online_shopping/skirts.dart';
import 'package:online_shopping/tops.dart';
import 'package:online_shopping/widgets/ItemsWidget.dart';

class HomePage extends StatelessWidget {
  final List<ItemData> pdList;
  final String userName;
  final String userEmail;

  HomePage({required this.userName, required this.userEmail})
      : pdList = ProductData().Items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SOISU CLOTHING",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF4C53A5),
      ),
      drawer: Drawer(
        child: NavBar(userName: userName, userEmail: userEmail),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "CATEGORIES",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildCategoryButton(
                            context,
                            label: "Local Brands",
                            backgroundColor: Color(0xFF4C53A5),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Localbrand()),
                            ),
                          ),
                          SizedBox(width: 10),
                          _buildCategoryButton(
                            context,
                            label: "Hot Items",
                            backgroundColor: Color(0xFF4C53A5),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HotItems()),
                            ),
                          ),
                          SizedBox(width: 10),
                          _buildCategoryButton(
                            context,
                            label: "Dress",
                            backgroundColor: Color(0xFF4C53A5),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Dress()),
                            ),
                          ),
                          SizedBox(width: 10),
                          _buildCategoryButton(
                            context,
                            label: "Pants",
                            backgroundColor: Color(0xFF4C53A5),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => pant()),
                            ),
                          ),
                          SizedBox(width: 10),
                          _buildCategoryButton(
                            context,
                            label: "Skirts",
                            backgroundColor: Color(0xFF4C53A5),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Skirts()),
                            ),
                          ),
                          SizedBox(width: 10),
                          _buildCategoryButton(
                            context,
                            label: "Tops",
                            backgroundColor: Color(0xFF4C53A5),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Tops()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "NEW ARRIVALS",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          ItemsWidget(pdList[0]),
                          ItemsWidget(pdList[1]),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          ItemsWidget(pdList[2]),
                          ItemsWidget(pdList[3]),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, {
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
      ),
      child: Text(label),
    );
  }
}
