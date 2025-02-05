import 'package:flutter/material.dart';

class Accprofileview extends StatefulWidget {
  const Accprofileview({super.key});
  @override
  State<Accprofileview> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Accprofileview> {
  int _selectedTab = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _changeBottomNav(int index) {
    setState(() {});

    // Add navigation logic
    switch (index) {
      case 0:
        print("Home clicked");
        break;
      case 1:
        print("Search clicked");
        break;
      case 2:
        print("Add clicked");
        break;
      case 3:
        print("Messages clicked");
        break;
      case 4:
        print("Profile clicked");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share),
            onPressed: () {
              print("Share clicked");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                "image/images.jpg"), // Replace with NetworkImage if needed
          ),
          const SizedBox(height: 10),
          const Text(
            "Tann Tongei",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "@tannTongei",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            "1 follower • 4 following",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              print("Edit Profile clicked");
            },
            child: const Text("Edit profile",
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 20),
          _buildTabs(),
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _changeTab(0),
          child: Column(
            children: [
              Text("Created",
                  style: TextStyle(
                      color: _selectedTab == 0 ? Colors.white : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              if (_selectedTab == 0)
                Container(
                  height: 2,
                  width: 50,
                  color: Colors.white,
                ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => _changeTab(1),
          child: Column(
            children: [
              Text("Saved",
                  style: TextStyle(
                      color: _selectedTab == 1 ? Colors.white : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              if (_selectedTab == 1)
                Container(
                  height: 2,
                  width: 50,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    if (_selectedTab == 0) {
      return const Center(
        child: Text(
          "No Pins yet, but there's tons of potential",
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return const Center(
        child: Text(
          "Saved Pins will appear here.",
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
