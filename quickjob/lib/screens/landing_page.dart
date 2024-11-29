import 'package:flutter/material.dart';
import 'package:quickjob/screens/employee_register.dart';
import 'package:quickjob/screens/publisher_register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('images/logo.png'), width: 300),
          const Text("Welcome to Quickjob", style: TextStyle(fontSize: 38)),
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
                  Navigator.of(context).pushNamed('/employee_register');
                },
              ),
            ),
            ListTile(
              title: const Text("Job Publisher"),
              leading: Radio(
                value: "Job Publisher",
                groupValue: null,
                onChanged: (value) {
                  Navigator.of(context).pushNamed('/publisher_register');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
