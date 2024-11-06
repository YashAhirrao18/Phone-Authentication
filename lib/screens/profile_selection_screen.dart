// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widgets/heading_text.dart'; // Import your HeadingText widget
import '../widgets/next_button.dart'; // Import your NextButton widget

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  _ProfileSelectionScreenState createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String? selectedProfile; // Variable to hold the selected profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            // Heading Text
            const HeadingText('Select Your Profile'),
            const SizedBox(height: 25),

            // Container for Shipper profile selection
            Container(
              height: 100,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.black, width: 1), // Black border
                borderRadius:
                    BorderRadius.circular(0), // Rounded corners (optional)
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          height: 40, // Height of the row
                          child: Radio<String>(
                            value: 'shipper',
                            groupValue: selectedProfile,
                            onChanged: (value) {
                              setState(() {
                                selectedProfile =
                                    value; // Update the selected profile
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Space between radio and icon
                        Transform.scale(
                          scale: 1.5, // Scale the icon to make it larger
                          child: const Icon(Icons.person),
                        ),
                        const SizedBox(width: 8), // Space between icon and text
                        const Text('Shipper'),
                      ],
                    ),
                  ),
                  // Subheading with lorem text
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Space between the two profiles

            // Container for Transport profile selection
            Container(
              height: 100,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.black, width: 1), // Black border
                borderRadius:
                    BorderRadius.circular(0), // Rounded corners (optional)
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          height: 40, // Height of the row
                          child: Radio<String>(
                            value: 'transporter',
                            groupValue: selectedProfile,
                            onChanged: (value) {
                              setState(() {
                                selectedProfile =
                                    value; // Update the selected profile
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Space between radio and icon
                        Transform.scale(
                          scale: 1.5, // Scale the icon to make it larger
                          child: const Icon(Icons.local_shipping),
                        ),
                        const SizedBox(width: 8), // Space between icon and text
                        const Text('Transporter'),
                      ],
                    ),
                  ),
                  // Subheading with lorem text
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            NextButton(
              text: 'CONTINUE',
              height: 60,
              width: 380, // Custom width for the button
              onPressed: () {
                if (selectedProfile != null) {
                  // Navigate to the next screen after selection
                } else {
                  // Optionally, show a message if no profile is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a profile.')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
