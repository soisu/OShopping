import 'package:flutter/material.dart';
import 'package:online_shopping/models/Product_Data.dart';
import 'package:online_shopping/paymentmethod.dart';
import 'package:online_shopping/widgets/cartappbar.dart';
import 'package:online_shopping/widgets/cartbottomnavbar.dart';
import 'package:online_shopping/widgets/cartitemdisplay.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class CartPage extends StatefulWidget {
  final List<ItemData> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<int> itemCounts;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    itemCounts = List<int>.filled(widget.cartItems.length, 1);
    _calculateTotalPrice();
  }

  void _updateItemCount(int index, int count) {
    setState(() {
      itemCounts[index] = count;
      _calculateTotalPrice();
    });
  }

  void _calculateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < widget.cartItems.length; i++) {
      totalPrice += widget.cartItems[i].price * itemCounts[i];
    }
  }

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
              children: widget.cartItems.asMap().entries.map((entry) {
                int index = entry.key;
                ItemData item = entry.value;
                return CartItemDisplay(
                  item.images.isNotEmpty ? item.images[0] : 'assets/images/placeholder.png',
                  item.name,
                  item.price,
                  itemCounts[index],
                  onCountChanged: (count) => _updateItemCount(index, count),
                );
              }).toList(),
            ),
          ),
          CartBottomNavBar(totalPrice: totalPrice),
          /*ContainerButtonModel(
            containerWidth: MediaQuery.of(context).size.width,
            itext: "Checkout",
            bgColor: Color(0xFF4C53A5),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentMethodScreen(totalPrice: totalPrice)),
              );
            },
          ),*/
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
