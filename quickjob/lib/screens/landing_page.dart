import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 100),
          Text("Welcome to Quickjob", style: TextStyle(fontSize: 24)),
          Text("Sri Lanka's NO:01 Microjob Finding Platform"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showRoleSelection(context);
            },
            child: Text("Get Started"),
          ),
        ],
      ),
    );
  }

  void _showRoleSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("What is your Role?"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Employee"),
              leading: Radio(
                value: "Employee",
                groupValue: null,
                onChanged: (value) {
                  Navigator.pushNamed(context, '/employee_register');
                },
              ),
            ),
            ListTile(
              title: Text("Job Publisher"),
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
