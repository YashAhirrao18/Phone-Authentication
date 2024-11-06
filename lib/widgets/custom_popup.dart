// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CustomPopupDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  // Constructor to accept dynamic content for the dialog
  const CustomPopupDialog({
    Key? key,
    required this.title,
    required this.content,
    this.buttonText = 'OK', // Default value for button text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ignore: prefer_const_constructors
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
