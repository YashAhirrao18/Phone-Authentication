import 'package:flutter/material.dart';
import 'app_styles.dart';

class SubheadingText extends StatelessWidget {
  final String text; // Declare a final variable to hold the text

  const SubheadingText(this.text, {super.key}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text, // Use the passed text
        textAlign: TextAlign.center,
        style: AppStyles.subheadingStyle,
      ),
    );
  }
}
