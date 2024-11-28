import 'package:flutter/material.dart';

class PublisherRegisterPage extends StatefulWidget {
  const PublisherRegisterPage({super.key});

  @override
  _PublisherRegisterPageState createState() => _PublisherRegisterPageState();
}

class _PublisherRegisterPageState extends State<PublisherRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? "Enter your phone number" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                    ? "Enter a valid email"
                    : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Username"),
                validator: (value) =>
                    !value!.startsWith("pub") ? "Username must start with 'pub'" : null,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save to Firebase
                  }
                },
                child: const Text("Register"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
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
