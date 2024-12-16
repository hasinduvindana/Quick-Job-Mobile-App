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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
          
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Centered Title
                    const Text(
                      "Publisher Registration",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Adjust based on your background
                      ),
                    ),
                    const SizedBox(height: 20),
                  // Add the Image widget for the registration icon
                  const Image(
                  image: AssetImage('images/registration-icon.png'),
                  width: 150, // Adjust the size as needed
                  height: 150,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      validator: (value) => value!.isEmpty ? "Enter your name" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) => value!.isEmpty ? "Enter your phone number" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                          ? "Enter a valid email"
                          : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      validator: (value) => value!.startsWith("pub")
                          ? null
                          : "Username must start with 'pub'",
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
                      validator: (value) =>
                          value!.length < 8 ? "Password must be at least 8 characters" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: "Re-enter Password",
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
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
          ),
        ),
      ),
    );
  }
}
