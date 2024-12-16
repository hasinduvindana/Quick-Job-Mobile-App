import 'package:flutter/material.dart';

class EmployeeDashboardPage extends StatelessWidget {
  const EmployeeDashboardPage({super.key, required username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee Dashboard")),
      body: const Center(
        child: Text("Welcome to the Employee Dashboard!"),
      ),
    );
  }
}
