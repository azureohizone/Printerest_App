import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/detailScreen/detail_screen.dart';
//import '../img/images_data.dart';
import '../img/all.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Row(
            children: [
              Expanded(
                child: TabBar(
                  isScrollable: true,
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
                    Tab(text: "All"),
                    Tab(text: "Like"),
                    Tab(text: "Anime"),
                    Tab(text: "Like"),
                    Tab(text: "Nature"),
                    Tab(text: "Movie"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PinsScreen(),
            PinsScreen(),
            PinsScreen(),
            PinsScreen(),
            PinsScreen(),
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
          const SizedBox(height: 15),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: allImg.length,
                itemBuilder: (context, index) {
                  return _buildImageCard(
                      context, allImg[index]["image"]!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Grid
Widget _buildImageCard(BuildContext context, String imagePath) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailScreen(),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: 0.8,
                    child: const Icon(
                      Icons.push_pin_rounded,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
