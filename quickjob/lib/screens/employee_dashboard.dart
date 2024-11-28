import 'package:flutter/material.dart';

class EmployeeDashboard extends StatelessWidget {
  final String username;

  EmployeeDashboard({required this.username});

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search for jobs...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem(child: Text("Colombo"), value: "Colombo"),
                    DropdownMenuItem(child: Text("Galle"), value: "Galle"),
                  ],
                  onChanged: (value) {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Perform search
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with dynamic job list count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.work),
                  title: Text("Job Title $index"),
                  subtitle: Text("Location $index"),
                  trailing: Text("Date $index"),
                  onTap: () {
                    Navigator.pushNamed(context, '/view_ad_page');
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
