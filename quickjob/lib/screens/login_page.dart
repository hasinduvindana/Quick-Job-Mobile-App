import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
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
          ],
        ),
      ),
    );
  }
}
