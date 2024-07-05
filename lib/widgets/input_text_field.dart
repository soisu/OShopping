import 'package:flutter/material.dart';

Widget inputFile({label, obscureText = false, hintLabel})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xFF4C53A5),

        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        
        decoration: InputDecoration(
          hintText: hintLabel,
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      
    ]
  );
}