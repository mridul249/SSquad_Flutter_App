import 'package:flutter/material.dart';

class CreateAdButton extends StatelessWidget {
  final VoidCallback onTap;

  const CreateAdButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final padding = screenWidth * 0.04;
    final fontSize = screenWidth * 0.04;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015), // 1.5% of screen height
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Color(0xFF29bc2f), width: 2),
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Center(
            child: Text(
              "Create new AD +",
              style: TextStyle(
                color: Colors.green,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
