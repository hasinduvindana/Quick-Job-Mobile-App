import 'package:flutter/material.dart';
import 'package:quickjob/screens/employee_login_page.dart'; // Add this import
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import
import 'package:firebase_auth/firebase_auth.dart'; // Add this import

class EmployeeRegisterPage extends StatefulWidget {
  const EmployeeRegisterPage({super.key});

  @override
  _EmployeeRegisterPageState createState() => _EmployeeRegisterPageState();
}

class _EmployeeRegisterPageState extends State<EmployeeRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registration successfully!")),
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
                      "Employee Registration",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Adjust based on your background
                      ),
                    ),
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
                       validator: (value) => value!.startsWith("emp")
                          ? null
                          : "Username must start with 'emp'",
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
                      validator: (value) =>
                          value!.isEmpty ? "Enter your phone number" : null,
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
                      validator: (value) => !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value!)
                          ? "Enter a valid email"
                          : null,
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
                      validator: (value) => value != _passwordController.text
                          ? "Passwords do not match"
                          : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            CollectionReference collReff = FirebaseFirestore
                                .instance
                                .collection('employee');
                            await collReff.add({
                              'name': _nameController.text,
                              'phone': _phoneController.text,
                              'email': _emailController.text,
                              'password': _passwordController.text,
                            });
                            _showSuccessMessage();
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              _showErrorMessage(
                                  'The email address is already in use.');
                            } else {
                              _showErrorMessage('An error occurred.');
                            }
                          } catch (e) {
                            _showErrorMessage(
                                'An error occurred. Please try again.');
                          }
                        }
                      },
                      child: const Text("Register"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
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
