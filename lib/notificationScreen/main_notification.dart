import 'package:flutter/material.dart';
import 'package:pinterest_clone/notificationScreen/chat_screen.dart';


class MainMessageScreen extends StatefulWidget {
  @override
  _MainMessageScreenState createState() => _MainMessageScreenState();
}

class _MainMessageScreenState extends State<MainMessageScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    UpdatesScreen(),
    MessagesScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _onTap(0),
              child: Text(
                'Updates',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () => _onTap(1),
              child: Text(
                'Messages',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}

class UpdatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: seaimg.length,
        itemBuilder: (context, index) {
          final item = seaimg[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            item['time']!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Ensure left alignment
          children: [
            Padding(
              padding: const EdgeInsets.all(19),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'New message',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), // Adjusted spacing

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Contacts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Contact List
            Expanded(
              child: ListView(
                children: const [
                  ContactItem(
                    name: 'Srey Pich',
                    username: '@pichs2551',
                    avatarColor: Colors.blueGrey,
                  ),
                  SizedBox(height: 12), // Adjusted spacing
                  ContactItem(
                    name: 'Freepik',
                    username: '@freepik',
                    avatarColor: Colors.blue,
                  ),
                  SizedBox(height: 12),
                  ContactItem(
                    name: 'Invite your friends',
                    username: 'Connect to start chatting',
                    avatarColor: Colors.grey,
                    isInvite: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final String username;
  final Color avatarColor;
  final bool isInvite;

  const ContactItem({
    required this.name,
    required this.username,
    required this.avatarColor,
    this.isInvite = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (!isInvite) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ),
          );
        }
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: avatarColor,
        child: isInvite
            ? const Icon(Icons.person_add, color: Colors.white)
            : Text(
                name[0],
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
      ),
      title: Text(
        name,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        username,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
      trailing: isInvite
          ? null
          : const Icon(Icons.chevron_right, color: Colors.white),
    );
  }
}

final List<Map<String, String>> seaimg = 
[
  {
    "title": "Milos Island Greece",
    "image": "assets/images/sea/Milos Island Greece.jpeg",
    "time": "2h",
  },
  {
    "title": "This could be your vibe",
    "image": "assets/images/sea/Pin Image (2).jpeg",
    "time": "2h",
  },
  {
    "title": "Wallpaper for you",
    "image": "assets/images/sea/Pin Image (3).jpeg",
    "time": "12h",
  },
  {
    "title": "These ideas are for you",
    "image": "assets/images/sea/Pin Image (4).jpeg",
    "time": "6d",
  },
  {
    "title": "You have a good eyes",
    "image": "assets/images/sea/Pin Image (5).jpeg",
    "time": "1m",
  },
  {
    "title": "Ideas for you",
    "image": "assets/images/sea/Pin Image (6).jpeg",
    "time": "8h",
  },
  {
    "title": "Wallpaper for you",
    "image": "assets/images/sea/Pin Image (7).jpeg",
    "time": "3d",
  },
  {
    "title": "Your kind of vibe",
    "image": "assets/images/sea/Pin Image (8).jpeg",
    "time": "1h",
  },
  {
    "title": "Fastastic taste",
    "image": "assets/images/sea/Pin Image (9).jpeg",
    "time": "2m",
  },
  {
    "title": "Check what we got for you",
    "image": "assets/images/sea/Pin Image (10).jpeg",
    "time": "10h",
  },
  {
    "title": "Pin Page Image",
    "image": "assets/images/sea/Pin page image.jpeg",
    "time": "5m",
  },
  {
    "title": "Your home feed has new Pins",
    "image": "assets/images/sea/Pinterest Pin Image (1).jpeg",
    "time": "4h",
  },
  {
    "title": "Inspired by you",
    "image": "assets/images/sea/Pinterest Pin Image (2).jpeg",
    "time": "7h",
  },
  {
    "title": "Check this out",
    "image": "assets/images/sea/9304563f-08a7-455d-9cfe-b4774b6331d7.jpeg",
    "time": "2h",
  }
];
