import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/accSettingScreen/AccountScreen.dart';
import 'package:pinterest_clone/img/all.dart';
import '../img/images_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Row(
            children: [
                  TextButton(
                onPressed: () {
                  // You probably don't want to navigate to the same screen here.
                   Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountScreen()
                  ),
                );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text("T", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 3.0,
                  dividerHeight: 0,
                  labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 16, color: Colors.white54),
                  tabs: [
                    Tab(text: "Pins"),
                    Tab(text: "Boards"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PinsScreen(),
            BoardsScreen(),
          ],
        ),
      ),
    );
  }
}

class PinsScreen extends StatelessWidget {
  const PinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const SearchBar(),
          const SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1),
                    backgroundColor: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 1),
                  backgroundColor: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.white),
                    Text("Favorites",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 1),
                  backgroundColor: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
                child: const Text("For you",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: MasonryGridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: allImg.length,
                itemBuilder: (context, index) {
                  return _buildImageCard(allImg[index]["image"]!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildImageCard(String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
    ),
  );
}

class FilterButton extends StatelessWidget {
  final String text;
  const FilterButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

class BoardsScreen extends StatelessWidget {
  const BoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          const SearchBar(),
          const SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1),
                    backgroundColor: Colors.grey[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: const Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 1),
                  backgroundColor: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                child: const Text("Group",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: boards.length,
            itemBuilder: (context, index) {
              return BoardTile(
                title: boards[index]["title"],
                pins: boards[index]["pins"],
                time: boards[index]["time"],
                imageUrl: boards[index]["image"],
              );
            },
          ),
          const SizedBox(height: 20),
          const Text("Board suggestions",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return SuggestionTile(
                  title: suggestions[index]["title"],
                  pins: suggestions[index]["pins"],
                  imageUrl: suggestions[index]["image"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[900],
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: "Search your saved ideas",
              hintStyle: const TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}

class BoardTile extends StatelessWidget {
  final String title, pins, time, imageUrl;

  const BoardTile(
      {super.key,
      required this.title,
      required this.pins,
      required this.time,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text("$pins • $time",
                style: const TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class SuggestionTile extends StatelessWidget {
  final String title, pins, imageUrl;

  const SuggestionTile(
      {super.key,
      required this.title,
      required this.pins,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(pins,
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Create",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
