import 'package:flutter/material.dart';
import 'package:quickjob/screens/employee_register.dart'; // Add this import

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100), // Ensure this path is correct
            const SizedBox(height: 20),
            const Text("Login", style: TextStyle(fontSize: 24)),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (value) =>
                  !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                      ? "Enter a valid email"
                      : null,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (value) =>
                  value!.isEmpty ? "Enter your password" : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform login and OTP verification
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EmployeeRegisterPage()),
                );
              },
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}