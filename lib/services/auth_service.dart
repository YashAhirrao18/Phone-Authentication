import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Send OTP to the provided mobile number
  Future<void> sendOtp(String mobileNumber) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$mobileNumber',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Failed to verify phone number: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verification ID for OTP verification
        AuthService.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        AuthService.verificationId = verificationId;
      },
    );
  }

  static String? verificationId;

  // Verify the OTP entered by the user
  Future<bool> verifyOtp(String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print('Invalid OTP');
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
