import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.asset(
          'assets/images/image.png',
          width: 80,
          height: 80,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
