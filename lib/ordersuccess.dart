import 'package:flutter/material.dart';
import 'package:online_shopping/homepage.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "image/orderconfirm.png",
                  height: 300,
                ),
                SizedBox(height: 15),
                Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your order will be delivered soon.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Thank you for choosing our app.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              

              child: InkWell(
  onTap: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage(userName: '', userEmail: '')),
      (route) => false, // Prevents going back to previous screens
    );
  },
  child: Container(
    width: MediaQuery.of(context).size.width * 0.3,
    height: 50,
    decoration: BoxDecoration(
      color: Color(0xFF4C53A5),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF4C53A5).withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    ),
    child: Center(
      child: Text(
        'Go to Home Page',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),






            ),
          ],
        ),
      ),
    );
  }
}
