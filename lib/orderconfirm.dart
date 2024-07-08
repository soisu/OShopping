import 'package:flutter/material.dart';
import 'package:online_shopping/ordersuccess.dart';
import 'package:online_shopping/paymentmethod.dart';
import 'package:online_shopping/shippingaddress.dart';
import 'package:online_shopping/widgets/ButtonModel.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class OrderConfirm extends StatelessWidget {
  final String fullName;
  final String phoneNumber;
  final String address;
  final String city;
  final String state;
  final String country;
  final double totalPrice;

  const OrderConfirm({
    Key? key,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Confirm",
          style: TextStyle(
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Color(0xFF4C53A5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF4C53A5),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              fullName,
                              style: TextStyle(fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShippingAddress(totalPrice: totalPrice),
                                  ),
                                );
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          phoneNumber,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          address,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "$city, $state, $country",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4C53A5),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Image.asset("image/kbzpay.jpg"),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub-Total",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                    Text(
                      "$totalPrice MMK",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Divider(
                  height: 20,
                  color: Color(0xFF4C53A5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                    Text(
                      "$totalPrice MMK",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ],
                ),
                /*SizedBox(height: 40),
                
                  TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderSuccess()),
                  );
                  debugPrint('Confirm Payment button tapped');
                  // Add your desired action here
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4C53A5)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Confirm Payment'),
        ),*/
        SizedBox(height: 100),
        ContainerButtonModel(
            containerWidth: MediaQuery.of(context).size.width,
            itext: "Confirm Payment",
            bgColor: Color(0xFF4C53A5),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderSuccess()),
              );
            },
          ),
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
