import 'package:flutter/material.dart';
import 'package:online_shopping/shippingaddress.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class PaymentMethodScreen extends StatefulWidget{
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
    _type = e as int;
  });

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method",
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
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: _type == 1
                      ? Border.all(width: 1, color: Color(0xFF4C53A5),)//payment box color
                      : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _type, 
                            onChanged: _handleRadio,
                            activeColor: Color(0xFF4C53A5),
                          ),
                          Text("KBZ Pay",
                          style: _type == 1 ? TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C53A5)) : TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            ),
                            
                          ),
                          Spacer(),
                          Image.asset(
                              "image/kbzpay.jpg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              
                              ),
                        ],
                      ),
                      
                    ),
                  ),
                   SizedBox(height: 15),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: _type == 2
                      ? Border.all(width: 1, color: Color(0xFF4C53A5),)//payment box color
                      : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _type, 
                            onChanged: _handleRadio,
                            activeColor: Color(0xFF4C53A5),
                          ),
                          Text("AYA Pay",
                          style: _type == 2 ? TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C53A5)) : TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            ),
                            
                          ),
                          Spacer(),
                          Image.asset(
                              "image/ayapay.jpg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              
                              ),
                        ],
                      ),
                      
                    ),
                  ),
                   
                   
                   SizedBox(height: 15),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: _type == 3
                      ? Border.all(width: 1, color: Color(0xFF4C53A5),)//payment box color
                      : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _type, 
                            onChanged: _handleRadio,
                            activeColor: Color(0xFF4C53A5),
                          ),
                          Text("WAVE Pay",
                          style: _type == 3 ? TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C53A5)) : TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            ),
                            
                          ),
                          Spacer(),
                          Image.asset(
                              "image/wavepay.jpg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                          ),

                        ],
                      ),  
                    ),
                  ),
        
                   SizedBox(height: 15),
                  Container(
                    width: size.width,
                    height: 55,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: _type == 4
                      ? Border.all(width: 1, color: Color(0xFF4C53A5),)//payment box color
                      : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: _type, 
                            onChanged: _handleRadio,
                            activeColor: Color(0xFF4C53A5),
                          ),
                          Text("Cash on Deli",
                          style: _type == 4 ? TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C53A5)) : TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            ),
                            
                          ),
                          Spacer(),
                          Image.asset(
                              "image/cashpay.jpg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                          ),
                        ],
                      ),  
                    ),
                  ),
        
                  SizedBox(height: 70),//100
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
        
                  /*SizedBox(height: 15),
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
                  ),*/
                  Divider(
                    height: 30,
                    color: Color(0xFF4C53A5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment (not include Shipping Fee)",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                      Text("73500",//78000
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4C53A5),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),//70
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShippingAddress()
                        ),
                      );
                    },
                    child: ContainerButtonModel(
                      itext: "Confirm Payment",
                      containerWidth: size.width,
                      bgColor: Color(0xFF4C53A5),
                    ),
                  ),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}