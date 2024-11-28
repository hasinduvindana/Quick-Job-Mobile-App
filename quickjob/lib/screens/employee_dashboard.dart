import 'package:flutter/material.dart';

class EmployeeDashboard extends StatelessWidget {
  final String username;

  const EmployeeDashboard({super.key, required this.username});

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Search for jobs...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(value: "Colombo", child: Text("Colombo")),
                    DropdownMenuItem(value: "Galle", child: Text("Galle")),
                  ],
                  onChanged: (value) {},
                ),
                IconButton(
                  icon: const Icon(Icons.search),
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
                  leading: const Icon(Icons.work),
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
