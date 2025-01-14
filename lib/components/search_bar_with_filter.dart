import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final fontSize = screenWidth * 0.04;
    final iconSize = screenWidth * 0.06;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
      child: Row(
        children: [
          Expanded( // Ensures the TextField takes up the available space
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: fontSize),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white, fontSize: fontSize),
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  borderSide: BorderSide(
                    color: Colors.grey[900]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  borderSide: BorderSide(
                    color: Colors.grey[900]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: screenWidth * 0.04), // 4% of screen width
          GestureDetector(
            onTap: () {
              // Filter functionality
            },
            child: Row(
              children: [
                Text(
                  "Filters",
                  style: TextStyle(color: Colors.grey, fontSize: fontSize * 0.9),
                ),
                Icon(Icons.tune, color: Colors.white, size: iconSize),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
