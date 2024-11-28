import 'package:flutter/material.dart';

class PublisherDashboard extends StatelessWidget {
  final String username;

  const PublisherDashboard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $username"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list_new_ad');
            },
            child: const Text("List New Ad"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with dynamic ad list count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.ad_units),
                  title: Text("Ad Title $index"),
                  subtitle: const Text("Details of the Ad"),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_applicants');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
