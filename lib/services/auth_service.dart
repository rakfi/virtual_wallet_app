import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Get instance of Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to listen for auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Sign in with Email & Password
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle errors like wrong password, user not found, etc.
      print("Error signing in: ${e.message}");
      return null;
    }
  }

  // Sign up with Email & Password
  Future<UserCredential?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // You can add logic here to create a user document in Firestore
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle errors like email already in use, weak password, etc.
      print("Error signing up: ${e.message}");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}