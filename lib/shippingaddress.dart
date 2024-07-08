import 'package:flutter/material.dart';
import 'package:online_shopping/orderconfirm.dart';
import 'package:online_shopping/widgets/ButtonModel.dart';

class ShippingAddress extends StatelessWidget {
  final double totalPrice;

  const ShippingAddress({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController countryController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shipping Address",
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mobile Phone Number",
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return 'Please enter a valid 11-digit phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "City",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: stateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "State/Region",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your state/region';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: countryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Country",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your country';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Prepare address data
                        String fullName = fullNameController.text;
                        String phoneNumber = phoneNumberController.text;
                        String address = addressController.text;
                        String city = cityController.text;
                        String state = stateController.text;
                        String country = countryController.text;

                        // Navigate to OrderConfirm and pass address data and totalPrice
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderConfirm(
                              fullName: fullName,
                              phoneNumber: phoneNumber,
                              address: address,
                              city: city,
                              state: state,
                              country: country,
                              totalPrice: totalPrice,
                            ),
                          ),
                        );
                      }
                    },
                    child: ButtonModel(
                      itext: "Add Address",
                      containerWidth: MediaQuery.of(context).size.width,
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
