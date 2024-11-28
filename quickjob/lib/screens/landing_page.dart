import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 100),
          const Text("Welcome to Quickjob", style: TextStyle(fontSize: 24)),
          const Text("Sri Lanka's NO:01 Microjob Finding Platform"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showRoleSelection(context);
            },
            child: const Text("Get Started"),
          ),
        ],
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
            ListTile(
              title: const Text("Employee"),
              leading: Radio(
                value: "Employee",
                groupValue: null,
                onChanged: (value) {
                  Navigator.pushNamed(context, '/employee_register');
                },
              ),
            ),
            ListTile(
              title: const Text("Job Publisher"),
              leading: Radio(
                value: "Job Publisher",
                groupValue: null,
                onChanged: (value) {
                  Navigator.pushNamed(context, '/publisher_register');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
