import 'package:flutter/material.dart';
import 'package:online_shopping/homepage.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context){
    return Material(
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
              Navigator.of(context).pop();
            },
            child: ContainerButtonModel(
              itext: "Continue Shopping",
              containerWidth: MediaQuery.of(context).size.width,
              bgColor: Color(0xFF4C53A5),
            ),
          ),
                    ),
        ],
      ),
    );
  }
}