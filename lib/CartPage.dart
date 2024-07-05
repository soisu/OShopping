import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/paymentmethod.dart';
import 'package:online_shopping/widgets/cartappbar.dart';
import 'package:online_shopping/widgets/cartbottomnavbar.dart';
import 'package:online_shopping/widgets/cartitemdisplay.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class CartPage extends StatelessWidget {
  final List<double> allPrices = [33500,22000,18000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),

          Container(
            height: 450,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
                children: [
                  CartItemDisplay('image/hazelintern2.jpg',"Intern Set",33500,1),
                  CartItemDisplay('image/mozelove1.jpg',"Scent of Love",22000,1),
                  CartItemDisplay('image/trinset3.jpg',"Black Boyfriend Shirt",18000,1),
                ],
              )
          ),
          CartBottomNavBar(allPrices),

         InkWell(
                 onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodScreen()),
                    );
                  },
                  child: ContainerButtonModel(
                  containerWidth: MediaQuery.of(context).size.width,
                    itext: "Checkout",
                   bgColor: Color(0xFF4C53A5),
                  ),
               ),
              SizedBox(height: 20),
        ],
      ),
    );
  }
}
