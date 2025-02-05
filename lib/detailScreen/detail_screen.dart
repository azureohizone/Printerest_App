import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/img/all.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/all/Pinterest Pin Image.jpeg',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.saved_search_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border,
                            color: Colors.white, size: 22),
                        const SizedBox(width: 5),
                        const Text('119',
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 16),
                        const Icon(Icons.chat_bubble_outline,
                            color: Colors.white, size: 22),
                        const SizedBox(width: 5),
                        const Text('2', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 16),
                        const Icon(Icons.upload, color: Colors.white, size: 22),
                        const SizedBox(width: 24),
                        const Icon(Icons.more_horiz,
                            color: Colors.white, size: 22),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://i.pinimg.com/736x/03/f4/88/03f488f4f1a83efdf1601ef0c957e1d9.jpg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'andrew',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'my kind of holiday ❤️ ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Divider(
                height: 0.5,
                thickness: 0.5,
                color: Color.fromARGB(157, 158, 158, 158),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      '2 comments',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://i.pinimg.com/736x/a6/c7/be/a6c7be0c0de9bb5e47f16f17a36e58ef.jpg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                              SizedBox(height: 2),
                              Text(
                                'See translation',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(211, 158, 158, 158)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      // height: 250, // Fixed height for MasonryGridView
                      child: MasonryGridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allImg.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return _buildImageCard(
                              allImg[index]["image"]!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allImg.length,
                  itemBuilder: (context, index) {
                    return _buildImageCard(allImg[index]["image"]!);
                  },
                ),
              ),
            ],
          ),
        ),
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
                  // Fixed here
                  imagePath,
                  fit: BoxFit.cover,
                  width: 150, // Adjust width
                  height: 200, // Adjust height
                ),
              ),
              const Positioned(
                right: 10,
                bottom: 10,
                child: Icon(
                  Icons.push_pin_rounded,
                  size: 20,
                  color: Colors.white,
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
}
