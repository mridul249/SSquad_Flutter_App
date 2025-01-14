import 'package:flutter/material.dart';

class EditAdvertisementPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  EditAdvertisementPage({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final fontSize = screenWidth * 0.04;
    final labelFontSize = screenWidth * 0.04;
    final padding = screenWidth * 0.04;
    final buttonHeight = screenHeight * 0.07;
    final buttonFontSize = screenWidth * 0.045;

    // Create text editing controllers
    final titleController = TextEditingController(text: title);
    final subtitleController = TextEditingController(text: subtitle);
    final descriptionController = TextEditingController(text: description);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Edit Advertisement",
          style: TextStyle(fontSize: fontSize,color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title input field
              Text(
                "Title",
                style: TextStyle(color: Colors.white, fontSize: labelFontSize),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Subtitle input field
              Text(
                "Subtitle",
                style: TextStyle(color: Colors.white, fontSize: labelFontSize),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  hintText: "Enter Subtitle",
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Description input field
              Text(
                "Description",
                style: TextStyle(color: Colors.white, fontSize: labelFontSize),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save logic here
                    Navigator.pop(context, {
                      'title': titleController.text,
                      'subtitle': subtitleController.text,
                      'description': descriptionController.text,
                    });
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: buttonFontSize),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(screenWidth * 0.8, buttonHeight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
