import 'package:flutter/material.dart';
import 'package:online_shopping/ordersuccess.dart';
import 'package:online_shopping/paymentmethod.dart';
import 'package:online_shopping/shippingaddress.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class OrderConfirm extends StatelessWidget{
  const OrderConfirm({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order",
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
          icon: Icon(Icons.arrow_back,
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
                    color:Colors.white,
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
                          Text("Dear Su",
                          style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ShippingAddress(),));
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
                          "09111222773",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "554 Khaymarthiri Qtr",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Myitkyina, Kachin, Myanmar",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PaymentMethodScreen(),));
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
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color:Colors.white,
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
                    SizedBox(width: 20),
                    Text("********773"),
                  ],
                ),

                SizedBox(height: 20),//40
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4C53A5),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Image.asset("image/ninjavan.jpg"),
                    ),
                  ],
                ),

                SizedBox(height: 20),//100
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-Total",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                      Text("73500",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Fee",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                      Text("4500",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                    ],
                  ),

                  Divider(
                    height: 20,
                    color: Color(0xFF4C53A5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                      Text("78000",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),//70
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSuccess()
                        ),
                      );
                    },
                    child: ContainerButtonModel(
                      itext: "Confirm Payment",
                      containerWidth: MediaQuery.of(context).size.width,
                      bgColor: Color(0xFF4C53A5),
                    ),
                  ),

              ],
            ),
              
          ),
        ),
      ),
    );
  }
}