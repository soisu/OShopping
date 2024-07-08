import 'package:flutter/material.dart';
import 'package:online_shopping/models/Product_Data.dart';
import 'package:online_shopping/productscreen.dart';


class ItemsWidget extends StatelessWidget {
  ItemData itemData = ItemData(0, "", "", "", "", [], "", 0, 0, 0,"", []);
  
  ItemsWidget(ItemData itemData){
    this.itemData = itemData;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.65,
      crossAxisCount: 1,
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 207, 209, 220),
          //color: Color.fromARGB(255, 83, 89, 156),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductScreen(itemData: itemData)),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                    itemData.images[0],
                    fit: BoxFit.cover,
                  ),
                  
                ),
              ),
              SizedBox(height: 5),
              Text(
                itemData.name,
                style: TextStyle(
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "MMK "+ itemData.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Color(0xFF4C53A5),
                  ),
                ]
              ),
            ],
          ),
        ),
      ],
    );
  }
}