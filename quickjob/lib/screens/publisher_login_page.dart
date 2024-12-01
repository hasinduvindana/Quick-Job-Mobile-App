
import 'package:flutter/material.dart';
import 'package:quickjob/screens/publisher_register.dart';

class PublisherLoginPage extends StatefulWidget {
  const PublisherLoginPage({super.key});

  @override
  _PublisherLoginPageState createState() => _PublisherLoginPageState();
}

class _PublisherLoginPageState extends State<PublisherLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Publisher Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/logo.png'),height: 100),
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
                  MaterialPageRoute(builder: (context) => const PublisherRegisterPage()),
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