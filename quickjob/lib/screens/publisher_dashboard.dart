import 'package:flutter/material.dart';

class PublisherDashboard extends StatelessWidget {
  final String username;

  PublisherDashboard({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $username"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
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
            child: Text("List New Ad"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with dynamic ad list count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.ad_units),
                  title: Text("Ad Title $index"),
                  subtitle: Text("Details of the Ad"),
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
