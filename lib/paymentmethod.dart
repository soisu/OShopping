import 'package:flutter/material.dart';
import 'package:online_shopping/shippingaddress.dart';
import 'package:online_shopping/widgets/ButtonModel.dart';

class PaymentMethodScreen extends StatefulWidget {
  final double totalPrice;

  const PaymentMethodScreen({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type = 1;

  void _handleRadio(int? value) {
    setState(() {
      _type = value ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Method",
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
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  // Payment method options
                  _buildPaymentOption(size, "KBZ Pay", "image/kbzpay.jpg", 1),
                  SizedBox(height: 15),
                  _buildPaymentOption(size, "AYA Pay", "image/ayapay.jpg", 2),
                  SizedBox(height: 15),
                  _buildPaymentOption(size, "WAVE Pay", "image/wavepay.jpg", 3),
                  SizedBox(height: 15),
                  _buildPaymentOption(size, "Cash on Delivery", "image/cashpay.jpg", 4),
                  SizedBox(height: 70), // Spacing
                  _buildPriceRow("Sub-Total", widget.totalPrice),
                  Divider(
                    height: 30,
                    color: Color(0xFF4C53A5),
                  ),
                  _buildPriceRow("Total Payment", widget.totalPrice),
                  SizedBox(height: 70), // Spacing
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShippingAddress(totalPrice: widget.totalPrice),
                        ),
                      );
                    },
                    child: ButtonModel(
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

  Widget _buildPaymentOption(Size size, String title, String imagePath, int value) {
    return Container(
      width: size.width,
      height: 55,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: _type == value ? 2 : 0.5,
          color: _type == value ? Color(0xFF4C53A5) : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: () => _handleRadio(value),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: _type,
              onChanged: _handleRadio,
              activeColor: Color(0xFF4C53A5),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: _type == value ? Color(0xFF4C53A5) : Colors.grey,
              ),
            ),
            Spacer(),
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xFF4C53A5),
          ),
        ),
        Text(
          "$amount MMK",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4C53A5),
          ),
        ),
      ],
    );
  }
}
