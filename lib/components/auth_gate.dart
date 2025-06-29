// lib/components/auth_gate.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/main_screen.dart'; // <-- CHANGE THIS
import 'login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return const MainScreen(); // <-- CHANGE THIS
          }
          // User is NOT logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}