import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text; // Add text parameter
  final double width;
  final double height;

  const NextButton({
    super.key,
    required this.onPressed,
    required this.text, // Make text required
    this.width = 120, // Default width if not provided
    this.height = 50, // Default height if not provided
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E3B62), // Background color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(0), // Optional: no rounded corners
          ),
        ),
        child: Text(
          text, // Use the text parameter for the button label
          style: const TextStyle(
            color: Colors.white, // Text color
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
