import 'package:flutter/material.dart';
import 'package:parallax_effect/widgets/image_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            onPageChanged: (value) {
              _selectedIndex = value;
              setState(() {});
            },
            itemCount: images.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return ImageCard(
                imagePath: images[index],
                isSelected: _selectedIndex == index,
              );
            },
          ),
        ),
      ),
    );
  }
}
