import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'publisher_register.dart';
import 'publisher_dashboard.dart';

class PublisherLoginPage extends StatefulWidget {
  const PublisherLoginPage({super.key});

  @override
  _PublisherLoginPageState createState() => _PublisherLoginPageState();
}

class _PublisherLoginPageState extends State<PublisherLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Query Firestore for user with matching email and password
        final QuerySnapshot result = await FirebaseFirestore.instance
            .collection('publisher')
            .where('email', isEqualTo: _emailController.text)
            .where('password', isEqualTo: _passwordController.text) // Ensure passwords are encrypted in production
            .get();

        if (result.docs.isNotEmpty) {
          // User authenticated successfully
          final userData = result.docs.first.data() as Map<String, dynamic>;
          _showMessage("Login successful!");

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => PublisherDashboard(
                username: userData['username'],
              ),
            ),
          );
        } else {
          // No matching user found
          _showMessage("Invalid email or password", isError: true);
        }
      } catch (e) {
        _showMessage("An error occurred. Please try again.", isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover, // Ensures the background image covers the screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage('images/logo.png'),
                    height: 100,
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Job Publisher Login",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your email";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text("Login"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PublisherRegisterPage(),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
