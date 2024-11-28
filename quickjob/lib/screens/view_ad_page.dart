import 'package:flutter/material.dart';

class ViewAdPage extends StatelessWidget {
  const ViewAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ad Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Ad Title", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Image.network("https://via.placeholder.com/150"), // Placeholder image
            const SizedBox(height: 10),
            const Text("Ad Description", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            const Text("Location: Colombo"),
            ElevatedButton(
              onPressed: () {
                // Submit application
              },
              child: const Text("Apply Now"),
            ),
          ],
        ),
      ),
    );
  }
}
