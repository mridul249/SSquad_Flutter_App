import 'package:flutter/material.dart';
import '../components/CustomDropdown.dart';

class NewAdPage extends StatefulWidget {
  @override
  _NewAdPageState createState() => _NewAdPageState();
}

class _NewAdPageState extends State<NewAdPage> {
  // Lists to store selected values
  List<String> selectedStates = [];
  List<String> selectedCities = [];
  List<String> selectedCountries = [];
  List<String> selectedKeywords = [];

  // Controllers for adding new values
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController keywordController = TextEditingController();

  // State variable for dropdown
  String selectedDiscountType = "Percentage";

  @override
  void initState() {
    super.initState();
    // Initialize dropdown with default value
    selectedDiscountType = "Percentage";
  }

  @override
  void dispose() {
    // Dispose controllers
    stateController.dispose();
    cityController.dispose();
    countryController.dispose();
    keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final padding = screenWidth * 0.04;
    final sectionFontSize = screenWidth * 0.045;
    final labelFontSize = screenWidth * 0.04;
    final textFieldFontSize = screenWidth * 0.04;
    final buttonFontSize = screenWidth * 0.045;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New AD",
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: screenWidth * 0.07),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Preview Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Preview",
                      style: TextStyle(color: Colors.white, fontSize: sectionFontSize),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Refresh logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Preview refreshed!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(horizontal: padding * 0.8, vertical: screenHeight * 0.015),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.025),
                        ),
                      ),
                      child: Text(
                        "Refresh",
                        style: TextStyle(color: Colors.white, fontSize: buttonFontSize),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Card(
                  color: Colors.grey[900],
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(padding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kofuku",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                "20% Off on All Burgers!",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF29BC2F),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                "Get 20% off on our entire range of delicious burgers. Available for dine-in and takeaway!",
                                style: TextStyle(
                                  fontSize: textFieldFontSize,
                                  color: Colors.white,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {
                            // Toggle state
                            setState(() {
                              // Implement toggle functionality if needed
                            });
                          },
                          activeColor: Color(0xFF29BC2F),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Form Sections
                buildFormSection("Ad Detail", sectionFontSize),
                buildTextField("Ad Title", "Enter title (e.g., 20% Off)", 50,1, textFieldFontSize),
                buildTextField("Ad Description", "Enter ad description", null, 3, textFieldFontSize),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add Media/Image functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Add Media/Image clicked')),
                    );
                  },
                  icon: Icon(Icons.add_photo_alternate, color: Colors.white, size: screenWidth * 0.06),
                  label: Text("Add Media/Image", style: TextStyle(color: Colors.white, fontSize: buttonFontSize)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                buildFormSection("Discount Details", sectionFontSize),
                CustomDropdown(
                  label: "Discount Type",
                  items: ["Percentage", "Flat Amount", "Cookies", "Crypto"],
                  selectedValue: selectedDiscountType,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedDiscountType = value;
                      });
                    }
                  },
                ),
                buildTextField("Discount Percentage", "Enter percentage (e.g., 20%)", null, 1, textFieldFontSize),
                SizedBox(height: screenHeight * 0.03),

                buildFormSection("Location", sectionFontSize),
                Text(
                  "Choose Countries",
                  style: TextStyle(color: Colors.white, fontSize: labelFontSize),
                ),
                buildChipInputWithAddIcon("Add countries", countryController, selectedCountries, textFieldFontSize, screenWidth),
                Text(
                  "Choose States",
                  style: TextStyle(color: Colors.white, fontSize: labelFontSize),
                ),
                buildChipInputWithAddIcon("Add states", stateController, selectedStates, textFieldFontSize, screenWidth),
                Text(
                  "Choose Cities",
                  style: TextStyle(color: Colors.white, fontSize: labelFontSize),
                ),
                buildChipInputWithAddIcon("Add cities", cityController, selectedCities, textFieldFontSize, screenWidth),
                SizedBox(height: screenHeight * 0.03),

                ElevatedButton(
                  onPressed: () {
                    // Create Ad functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('AD Created Successfully!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF29BC2F),
                    minimumSize: Size(double.infinity, screenHeight * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    ),
                  ),
                  child: Text(
                    "Create AD",
                    style: TextStyle(color: Colors.white, fontSize: buttonFontSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a section header for the form.
  Widget buildFormSection(String title, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: fontSize * 0.5),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Builds a styled TextField.
  Widget buildTextField(String label, String hint, int? maxLength, int? maxLines, double fontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fontSize * 0.5),
      child: TextField(
        maxLength: maxLength,
        minLines: 1,
        maxLines: maxLines ?? 1,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: fontSize * 0.9),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: fontSize * 0.9),
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(fontSize * 0.6),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(fontSize * 0.6),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(fontSize * 0.6),
            borderSide: BorderSide(color: Color(0xFF29BC2F)),
          ),
        ),
      ),
    );
  }

  /// Builds a Chip input field with an add icon.
  Widget buildChipInputWithAddIcon(String hint, TextEditingController controller, List<String> chips, double fontSize, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fontSize * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.white, fontSize: fontSize),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: fontSize * 0.9),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fontSize * 0.6),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fontSize * 0.6),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fontSize * 0.6),
                    borderSide: BorderSide(color: Color(0xFF29BC2F)),
                  ),
                ),
              ),
              Positioned(
                right: screenWidth * 0.02,
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.grey, size: fontSize * 1.2),
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      setState(() {
                        chips.add(controller.text.trim());
                        controller.clear();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: fontSize * 0.5),
          Wrap(
            spacing: screenWidth * 0.02,
            children: chips
                .map(
                  (chip) => Chip(
                label: Text(chip, style: TextStyle(color: Colors.white, fontSize: fontSize * 0.8)),
                backgroundColor: Colors.grey[800],
                deleteIcon: Icon(Icons.close, color: Colors.white, size: fontSize * 0.8),
                onDeleted: () {
                  setState(() {
                    chips.remove(chip);
                  });
                },
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
