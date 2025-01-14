import 'package:flutter/material.dart';

class TabsBar extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const TabsBar({required this.activeTab, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final tabFontSize = screenWidth * 0.04;
    final tabPaddingHorizontal = screenWidth * 0.045;
    final tabPaddingVertical = screenWidth * 0.02;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab(context, "Active", tabFontSize, tabPaddingHorizontal, tabPaddingVertical),
            _buildTab(context, "Inactive", tabFontSize, tabPaddingHorizontal, tabPaddingVertical),
            _buildTab(context, "Expired", tabFontSize, tabPaddingHorizontal, tabPaddingVertical),
            _buildTab(context, "All", tabFontSize, tabPaddingHorizontal, tabPaddingVertical),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String title, double fontSize, double paddingHorizontal, double paddingVertical) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: GestureDetector(
        onTap: () => onTabChange(title),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
          decoration: BoxDecoration(
            color: activeTab == title ? Color(0xFF29bc2f) : Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: activeTab == title ? Colors.white : Colors.grey[400],
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
