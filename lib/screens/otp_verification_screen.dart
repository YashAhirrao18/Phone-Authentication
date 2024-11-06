import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/heading_text.dart';
import '../widgets/otp_input_field.dart';
import '../widgets/subheading_text.dart';
import '../widgets/next_button.dart';
import 'profile_selection_screen.dart';
import '../services/auth_service.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String mobileNumber;

  const OTPVerificationScreen({super.key, required this.mobileNumber});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> otpFocusNodes =
      List.generate(6, (index) => FocusNode());
  bool _isResendDisabled = false;

  Future<void> _resendOtp() async {
    setState(() {
      _isResendDisabled = true; // Disable resend button temporarily
    });

    // Call the sendOtp function to resend OTP
    await AuthService().sendOtp(widget.mobileNumber);

    // Wait for a few seconds before enabling the button again (e.g., 30 seconds)
    await Future.delayed(const Duration(seconds: 30));

    if (mounted) {
      setState(() {
        _isResendDisabled = false; // Re-enable resend button if still mounted
      });
    }

    // Optionally show a message that the OTP was resent
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP resent successfully')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose all controllers and focus nodes
    for (final controller in otpControllers) {
      controller.dispose();
    }
    for (final focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadingText('Verify Phone'),
                const SizedBox(height: 10),
                SubheadingText("Code is sent to ${widget.mobileNumber}"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return OTPInputField(
                      controller: otpControllers[index],
                      focusNode: otpFocusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          // Move focus to the next field
                          FocusScope.of(context)
                              .requestFocus(otpFocusNodes[index + 1]);
                        }
                      },
                    );
                  }),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      const TextSpan(text: "Didn’t receive code? "),
                      TextSpan(
                        text: "Request again",
                        style: TextStyle(
                          color: _isResendDisabled
                              ? Colors.grey
                              : const Color(0xFF2E3B62),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _isResendDisabled ? null : _resendOtp,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                NextButton(
                  onPressed: () async {
                    String otp = otpControllers.map((c) => c.text).join();
                    bool isVerified = await AuthService().verifyOtp(otp);
                    if (isVerified) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileSelectionScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid OTP')),
                      );
                    }
                  },
                  width: 350,
                  height: 50,
                  text: 'Verify and Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
