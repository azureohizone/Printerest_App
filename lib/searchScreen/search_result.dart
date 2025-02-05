import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/img/all.dart';
import '../searchScreen/filter_screen.dart';


class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController =
        TextEditingController(text: "Sport cars");

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextField(
            controller: searchController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Anime sketch",
              hintStyle: TextStyle(color: Colors.white54),
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterChips(context), // Pass context here
          // Expanded(
          //   child: GridView.builder(
          //     padding: const EdgeInsets.symmetric(horizontal: 8),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 8,
          //       mainAxisSpacing: 8,
          //       childAspectRatio: 0.6,
          //     ),
          //     itemCount: pinterestImages.length,
          //     itemBuilder: (context, index) {
          //       return LayoutBuilder(
          //         builder: (context, constraints) {
          //           return _buildImageCard(pinterestImages[index]["image"]!);
          //         },
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: MasonryGridView.builder(
              itemCount: sportcars.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) {
                return _buildImageCard(sportcars[index]["img"]!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Padding(
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
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    List<Color> chipColors = [
      const Color(0xFFFFE1EC),
      const Color(0xFFDBD3FF),
      const Color(0xFFD7ECFF),
      const Color(0xFFDAFFF8)
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        children: [
          _buildFilterIcon(context), // Pass context to _buildFilterIcon
          ...seaimg.asMap().entries.map((entry) {
            int index = entry.key;
            var chip = entry.value;
            return _buildFilterChipWithImage(chip["title"]!, chip["image"]!,
                chipColors[index % chipColors.length]);
          }),
        ],
      ),
    );
  }

  Widget _buildFilterChipWithImage(
      String title, String imagePath, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FilterScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white24,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.tune,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
