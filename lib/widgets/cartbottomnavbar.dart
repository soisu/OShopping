import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget{
  List<double> allPrices = List.empty();
  String amount = '';

  CartBottomNavBar(List<double> allPrices) {
    this.allPrices = allPrices;
    SumTotal();
  } 

  AddToCart(double price){
    allPrices.add(price);
    SumTotal();
  }

  SumTotal(){
    double sum = 0;
    allPrices.forEach((element) {
      sum += element;
    });
    amount = sum.toString();
  }

  @override
  Widget build (BuildContext context){
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        height: 85,
        decoration: BoxDecoration(
          color: Color(0xFF4C53A5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total : " + amount,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}