import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  CustomDropdown({
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.grey[900], // Dropdown menu background
                cardTheme: CardTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Dropdown radius
                  ),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey[900],
                  value: selectedValue,
                  isExpanded: true,
                  alignment: AlignmentDirectional.centerStart, // Align selected text to the start
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  items: _buildDropdownItems(items),
                  onChanged: onChanged,
                  selectedItemBuilder: (BuildContext context) {
                    // Custom builder for selected item to fix spacing
                    return items.map<Widget>((String item) {
                      return Container(
                        alignment: Alignment.centerLeft, // Align text to the left
                        padding: EdgeInsets.zero, // Remove extra padding
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds dropdown items with dividers between them.
  List<DropdownMenuItem<String>> _buildDropdownItems(List<String> items) {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (int i = 0; i < items.length; i++) {
      dropdownItems.add(
        DropdownMenuItem<String>(
          value: items[i],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Even spacing
                child: Text(
                  items[i],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              if (i < items.length-1) // Add divider except for the last item
                Divider(
                  color: Colors.grey[600], // Divider color
                  thickness: 1, // Divider thickness
                  height: 1, // Height between divider and options
                ),
            ],
          ),
        ),
      );
    }
    return dropdownItems;
  }
}
