import 'package:flutter/material.dart';

class PublisherRegisterPage extends StatefulWidget {
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
      appBar: AppBar(title: Text("Publisher Register")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? "Enter your phone number" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                    ? "Enter a valid email"
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Username"),
                validator: (value) =>
                    !value!.startsWith("pub") ? "Username must start with 'pub'" : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) =>
                    value!.length < 8 ? "Password must be at least 8 characters" : null,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: "Re-enter Password"),
                obscureText: true,
                validator: (value) =>
                    value != _passwordController.text ? "Passwords do not match" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save to Firebase
                  }
                },
                child: Text("Register"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Already a user? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
