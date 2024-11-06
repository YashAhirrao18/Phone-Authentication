import 'package:flutter/material.dart';
import 'package:phone_auth/widgets/custom_popup.dart';
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 120,
                ),
                // Heading Text
                const HeadingText('Please Enter Your Mobile Number'),
                const SizedBox(height: 10),
                // Subheading Text
                const SubheadingText(
                    'You will receive a 6-digit code \n to verify next'),
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
                          height: 30, // Adjust height as necessary
                          width: 50, // Adjust width as necessary
                        ),
                        SizedBox(width: 8),
                        Text(
                          '+91       \t\t\t- ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ), // Country code
                        SizedBox(width: 40),
                      ],
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 25),
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
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevent dismissing by tapping outside
                        builder: (BuildContext context) {
                          return const CustomPopupDialog(
                            title: 'Invalid Mobile Number',
                            content: 'Please enter a valid mobile number',
                            buttonText: 'Got it', // Custom button text
                          );
                        },
                      );
                      // Show an error message if mobile number is empty
                    }
                  },
                  width: 370,
                  height: 60,
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
