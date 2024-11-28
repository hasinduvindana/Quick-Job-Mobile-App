import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register with email and password
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print('Error in register: $e');
      return null;
    }
  }

  // Login with email and password
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print('Error in login: $e');
      return null;
    }
  }

  // Send OTP
  Future<void> sendOTP(String email) async {
    try {
      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
          url: 'https://quickjob.page.link/login',
          handleCodeInApp: true,
          androidPackageName: 'com.example.quickjob',
          androidInstallApp: true,
          iOSBundleId: 'com.example.quickjob',
        ),
      );
      print('OTP sent to $email');
    } catch (e) {
      print('Error sending OTP: $e');
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
