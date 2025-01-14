import 'package:flutter/material.dart';

class AdCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final bool isActive;
  final VoidCallback onEdit;

  const AdCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.isActive,
    required this.onEdit,
  });

  @override
  _AdCardState createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  void toggleSwitch() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes
    final titleFontSize = screenWidth * 0.045;
    final subtitleFontSize = screenWidth * 0.05;
    final descriptionFontSize = screenWidth * 0.035;
    final buttonFontSize = screenWidth * 0.04;
    final switchSize = screenWidth * 0.12;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background image fully stretched
          Positioned.fill(
            child: Image(
              image: widget.imagePath.startsWith('http')
                  ? NetworkImage(widget.imagePath)
                  : AssetImage(widget.imagePath) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
          // Dark overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          // Content and Switch
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: descriptionFontSize,
                          color: Colors.white,
                        ),
                        maxLines: null,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      GestureDetector(
                        onTap: widget.onEdit,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.01,
                          ),
                          child: Center(
                            child: Text(
                              "Edit Ad",
                              style: TextStyle(
                                color: Color(0xFF29BC2F),
                                fontSize: buttonFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: toggleSwitch,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: switchSize,
                      height: switchSize * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(switchSize / 2),
                        color: isActive ? Color(0xFF29BC2F) : Colors.grey,
                      ),
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            left: isActive ? switchSize * 0.5 : 0,
                            right: isActive ? 0 : switchSize * 0.5,
                            child: Container(
                              width: switchSize * 0.5,
                              height: switchSize * 0.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
