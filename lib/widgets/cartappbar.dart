import 'package:flutter/material.dart';
class CartAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
 
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(  children: [
          IconButton(
            onPressed: () {             
               Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: Color(0xFF4C53A5),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "My Cart",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4C53A5),
            ),
          ),
        ),
        Spacer(),
        Icon(
          Icons.more_vert,
          size: 30,
          color: Color(0xFF4C53A5),
          ),
        ],
      ),
    );
  }
}