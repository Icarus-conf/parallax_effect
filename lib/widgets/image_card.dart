import 'package:flutter/material.dart';
import 'package:parallax_effect/widgets/ParallaxFlowDelegate.dart';

class ImageCard extends StatefulWidget {
  final String imagePath;
  final bool isSelected;
  const ImageCard({
    super.key,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: widget.isSelected
          ? const EdgeInsets.symmetric(vertical: 16, horizontal: 4)
          : const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: _imageKey,
          ),
          children: [
            Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              key: _imageKey,
            ),
          ],
        ),
      ),
    );
  }
}
