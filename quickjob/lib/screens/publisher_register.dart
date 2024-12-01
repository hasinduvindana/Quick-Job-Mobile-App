import 'package:flutter/material.dart';
import 'package:quickjob/screens/publisher_login_page.dart'; // Add this import
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import
import 'package:firebase_auth/firebase_auth.dart'; // Add this import

class PublisherRegisterPage extends StatefulWidget {
  const PublisherRegisterPage({super.key});

  @override
  _PublisherRegisterPageState createState() => _PublisherRegisterPageState();
}

class _PublisherRegisterPageState extends State<PublisherRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registration successful!")),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Publisher Register")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? "Enter your phone number" : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                    ? "Enter a valid email"
                    : null,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (value) =>
                    value!.startsWith("pub") ? null : "Username must start with 'pub'",
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) =>
                    value!.length < 8 ? "Password must be at least 8 characters" : null,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(labelText: "Re-enter Password"),
                obscureText: true,
                validator: (value) =>
                    value != _passwordController.text ? "Passwords do not match" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      CollectionReference collReff =
                          FirebaseFirestore.instance.collection('publisher');
                      await collReff.add({
                        'name': _nameController.text,
                        'phone': _phoneController.text,
                        'email': _emailController.text,
                        'username': _usernameController.text,
                        'password': _passwordController.text, // Encrypt passwords in production
                      });
                      _showSuccessMessage();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const PublisherLoginPage()),
                      );
                    } catch (e) {
                      _showErrorMessage('An error occurred. Please try again.');
                    }
                  }
                },
                child: const Text("Register"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PublisherLoginPage()),
                  );
                },
                child: const Text("Already a user? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






