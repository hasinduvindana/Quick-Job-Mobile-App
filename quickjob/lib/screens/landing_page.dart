import 'package:flutter/material.dart';
import 'package:quickjob/screens/employee_register.dart';
import 'package:quickjob/screens/publisher_register.dart';
import 'package:quickjob/screens/employee_login_page.dart';
import 'package:quickjob/screens/publisher_login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/logo.png'),
                width: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to Quickjob",
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white, // Adjust color to contrast with the background
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sri Lanka's NO:01 Microjob Finding Platform",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Adjust color for better visibility
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showRoleSelection(context);
                },
                child: const Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRoleSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("What is your Role?"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Employee"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PublisherLoginPage()),
                );
              },
              child: const Text("Job Publisher"),
            ),
          ],
        ),
      ),
    );
  }
}
