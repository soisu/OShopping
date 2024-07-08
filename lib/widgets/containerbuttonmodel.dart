import 'package:flutter/material.dart';

class ContainerButtonModel extends StatelessWidget {
  final Color bgColor;
  final double containerWidth;
  final String itext;
  final VoidCallback onTap;

  const ContainerButtonModel({
    super.key,
    required this.bgColor,
    required this.containerWidth,
    required this.itext,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            itext,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
