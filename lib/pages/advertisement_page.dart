import 'package:flutter/material.dart';
import '../components/create_ad_button.dart';
import '../components/tabs_bar.dart';
import '../components/search_bar_with_filter.dart' as custom;
import '../components/bottom_nav_bar.dart';
import '../components/ad_card.dart';
import 'NewAdPage.dart';
import 'EditAdvertisement.dart';

class AdvertisementPage extends StatefulWidget {
  @override
  _AdvertisementPageState createState() => _AdvertisementPageState();
}

class _AdvertisementPageState extends State<AdvertisementPage> {
  String activeTab = "Active";

  // Dummy ad data for local images
  final List<Map<String, dynamic>> ads = [
    {
      "title": "Sushi Delights",
      "subtitle": "30% Off on Rolls!",
      "description": "Fresh sushi rolls with 30% discount. Limited time offer.",
      "imagePath": "assets/images/img.png",
      "isActive": true,
    },
    {
      "title": "Free Dessert!",
      "subtitle": "Enjoy a sweet treat",
      "description": "Get a free dessert with every meal. Only this weekend!",
      "imagePath": "assets/images/img1.png",
      "isActive": true,
    },
    {
      "title": "Taco Tuesday",
      "subtitle": "Half Price Tacos!",
      "description": "Celebrate Taco Tuesday with half-price tacos. Dine-in only.",
      "imagePath": "assets/images/img2.png",
      "isActive": true,
    },
    {
      "title": "Shrimp Tacos",
      "subtitle": "Bold Flavors!",
      "description": "Try our spicy shrimp tacos. Available for a limited time.",
      "imagePath": "assets/images/img3.png",
      "isActive": true,
    },
    {
      "title": "Burger Bonanza",
      "subtitle": "Special Offer",
      "description": "Juicy burgers at special prices. Don't miss out!",
      "imagePath": "assets/images/img4.png",
      "isActive": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Obtain screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive padding , percent of screen width
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenHeight * 0.01;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Advertisement",
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05), // Responsive font size
        ),
        actions: [
          IconButton(
            onPressed: () {
              // go to notification page
            },
            icon: Icon(Icons.notifications, color: Colors.white, size: screenWidth * 0.06),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey.shade800,
              margin: EdgeInsets.symmetric(vertical: verticalPadding),
            ),
            // Top section with Create Ad Button
            CreateAdButton(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewAdPage()),
              );
            }),
            // Divider after Create Ad Button
            Container(
              height: 1,
              color: Colors.grey.shade800,
              margin: EdgeInsets.symmetric(vertical: verticalPadding),
            ),
            // Tabs Bar
            TabsBar(
              activeTab: activeTab,
              onTabChange: (tab) {
                setState(() {
                  activeTab = tab;
                });
              },
            ),
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: custom.SearchBar(),
            ),
            // Flexible widget for the remaining content
            Expanded(
              child: ListView.builder(
                itemCount: ads.length,
                itemBuilder: (context, index) {
                  final ad = ads[index];
                  if (activeTab == "Active" && !ad['isActive']) {
                    return SizedBox.shrink();
                  }
                  if (activeTab == "Inactive" && ad['isActive']) {
                    return SizedBox.shrink();
                  }
                  return AdCard(
                    title: ad['title'],
                    subtitle: ad['subtitle'],
                    description: ad['description'],
                    imagePath: ad['imagePath'], // Local image path
                    isActive: ad['isActive'],
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAdvertisementPage(
                            title: ad['title'],
                            subtitle: ad['subtitle'],
                            description: ad['description'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
