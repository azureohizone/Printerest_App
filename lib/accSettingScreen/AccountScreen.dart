import 'package:flutter/material.dart';
import 'package:pinterest_clone/accSettingScreen/accProfileview.dart';



class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your account"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildProfileSection(context),  // Pass context to this method
          _buildSectionTitle("Settings"),
          _buildSettingsItem("Account management"),
          _buildSettingsItem("Profile visibility"),
          _buildSettingsItem("Home feed tuner"),
          _buildSettingsItem("Claimed accounts"),
          _buildSettingsItem("Social permissions and activity"),
          _buildSettingsItem("Notifications"),
          _buildSettingsItem("Privacy and data"),
          _buildSettingsItem("Reports and violations center"),
          _buildSectionTitle("Login"),
          _buildSettingsItem("Add account"),
          _buildSettingsItem("Security"),
          _buildSettingsItem("Be a beta tester"),
          _buildSettingsItem("Log out"),
        ],
      ),
    );
  }

  // Updated method to accept BuildContext for navigation
Widget _buildProfileSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // Changed to center
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          child: Text("T", style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        const SizedBox(width: 16),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tongeitann",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Accprofileview ()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  "View profile",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingsItem(String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {},
    );
  }

  
    
  
}
