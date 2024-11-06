// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/mobile_number_screen.dart';
import '../widgets/heading_text.dart'; // Import your HeadingText widget
import '../widgets/language_dropdown.dart';
import '../widgets/subheading_text.dart'; // Import your SubheadingText widget
import '../widgets/next_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage = 'English'; // Default value

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white, // Set background to pure white
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
              ),
              // Image Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/image.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Heading Text
              const HeadingText('Please Select Your Language'),
              // Subheading Text
              const SubheadingText('You can change the language \n at anytime'),
              // Language Dropdown
              LanguageDropdown(
                selectedLanguage: _selectedLanguage!,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                },
              ),
              // Next Button
              NextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobileNumberScreen(),
                    ),
                  );
                },
                width: 280,
                height: 60,
                text: 'NEXT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
