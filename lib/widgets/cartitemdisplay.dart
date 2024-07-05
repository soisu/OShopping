import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemDisplay extends StatelessWidget{
  String img = '';
  String cartTitle = '';
  late double price;
  int count = 1;

  CartItemDisplay(String img, String cartTitle, double price, int count){
    this.img = img;
    this.cartTitle = cartTitle;
    this.price = price;
    this.count = count;
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Radio(
            value: "",
            groupValue: "",
            activeColor: Color(0xFF4C53A5),
            onChanged: (index) {},
          ),
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(right: 15),
            child: Image.asset(img),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cartTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4C53A5),
                  ),
                ),
                Text(
                  "Price - "+ price.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ],
            ),
          ),

          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Icon(
                  //Icons.delete,
                 // color: Colors.red,
               // ),
               IconButton(
            icon: Icon(Icons.delete, color: Colors.red), 
            onPressed: () {
              
            },
          ),
                Row(children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.plus,
                      size: 18,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(
                      CupertinoIcons.minus,
                      size: 18,
                    ),
                    
                  ),
                ],
                ),
              ]
            )
          )
        ],
        ),
      );
  }
}