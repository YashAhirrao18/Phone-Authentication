import 'package:flutter/material.dart';
import 'app_styles.dart'; // Ensure you import your AppStyles class

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;

  const OTPInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.otpBoxColor, // Background color for OTP input
          borderRadius:
              BorderRadius.circular(0), // Circular radius for better aesthetics
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode, // Connect the focus node
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors
                .transparent, // Keep the fill color transparent to see the container's color
            border: InputBorder.none, // Remove the border
            counterText: '', // Hide the counter text
            hintText: '0', // Optional: hint text for better UX
            hintStyle: AppStyles
                .subheadingStyle, // Using subheading style from AppStyles
          ),
          style: AppStyles
              .headingStyle, // Optional: Apply the heading style to the input text
          onChanged:
              onChanged, // Pass the onChanged callback to handle the focus shift
        ),
      ),
    );
  }
}
