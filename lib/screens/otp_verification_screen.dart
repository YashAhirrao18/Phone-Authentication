import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_popup.dart';
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
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismissing by tapping outside
        builder: (BuildContext context) {
          return const CustomPopupDialog(
            title: 'OTP Sent !',
            content: 'New OTP has been sent to Mobile Number',
            buttonText: 'Got it', // Custom button text
          );
        },
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
              children: [
                const SizedBox(
                  height: 100,
                ),
                const HeadingText('Verify Phone'),
                const SizedBox(height: 10),
                SubheadingText("Code is sent to ${widget.mobileNumber}"),
                const SizedBox(height: 25),
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
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      const TextSpan(text: "Didn’t receive code? "),
                      TextSpan(
                        text: "Request Again",
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
                const SizedBox(height: 25),
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
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // Prevent dismissing by tapping outside
                        builder: (BuildContext context) {
                          return const CustomPopupDialog(
                            title: 'Invalid OTP',
                            content: 'Kindly enter valid OTP and try again',
                            buttonText: 'Got it', // Custom button text
                          );
                        },
                      );
                    }
                  },
                  width: 370,
                  height: 60,
                  text: 'VERIFY AND CONTINUE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
