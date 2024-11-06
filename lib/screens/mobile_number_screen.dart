import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/heading_text.dart'; // Import your HeadingText widget
import '../widgets/subheading_text.dart'; // Import your SubheadingText widget
import '../widgets/next_button.dart';
import 'otp_verification_screen.dart';

class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController to manage the mobile number input
    final TextEditingController mobileController = TextEditingController();

    return GestureDetector(
      onTap: () =>
          FocusScope.of(context).unfocus(), // Dismiss the keyboard on tap
      child: Scaffold(
        backgroundColor: Colors.white, // Set background to white
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center, // Center the content
              children: [
                // Heading Text
                const HeadingText('Please Enter Your Mobile Number'),
                const SizedBox(height: 10),
                // Subheading Text
                const SubheadingText(
                    'You will receive a 6-digit code to verify next'),
                const SizedBox(height: 20),
                // Mobile number input field
                TextField(
                  controller: mobileController,
                  decoration: const InputDecoration(
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Replace flag with an Indian flag icon
                        Image(
                          image: AssetImage(
                              'assets/images/india_flag.png'), // Ensure you have the flag image in your assets
                          height: 20, // Adjust height as necessary
                          width: 30, // Adjust width as necessary
                        ),
                        SizedBox(width: 8),
                        Text('+91'), // Country code
                      ],
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                // Next Button
                NextButton(
                  onPressed: () async {
                    String mobileNumber = mobileController.text.trim();
                    if (mobileNumber.isNotEmpty) {
                      await AuthService().sendOtp(mobileNumber);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OTPVerificationScreen(mobileNumber: mobileNumber),
                        ),
                      );
                    } else {
                      // Show an error message if mobile number is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid mobile number'),
                        ),
                      );
                    }
                  },
                  width: 365,
                  height: 50,
                  text: 'CONTINUE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
