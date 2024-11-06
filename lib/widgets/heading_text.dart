import 'package:flutter/material.dart';
import 'app_styles.dart';

class HeadingText extends StatelessWidget {
  final String text; // Declare a final variable to hold the text

  const HeadingText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Text(
        text, // Use the passed text
        textAlign: TextAlign.center,
        style: AppStyles.headingStyle,
      ),
    );
  }
}
