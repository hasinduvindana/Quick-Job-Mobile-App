import 'package:flutter/material.dart';

class ViewAdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ad Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Ad Title", style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Image.network("https://via.placeholder.com/150"), // Placeholder image
            SizedBox(height: 10),
            Text("Ad Description", textAlign: TextAlign.center),
            SizedBox(height: 20),
            Text("Location: Colombo"),
            ElevatedButton(
              onPressed: () {
                // Submit application
              },
              child: Text("Apply Now"),
            ),
          ],
        ),
      ),
    );
  }
}
