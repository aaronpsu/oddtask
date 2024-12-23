import 'package:flutter/material.dart';

class JobFeedScreen extends StatelessWidget {
  const JobFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Card(
          child: ListTile(
            title: const Text('Freelancer Needed for Web Design'),
            subtitle: const Text('Budget: \$500 - Deadline: 2 weeks'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to Job Detail Screen
            },
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('Graphic Designer for Branding'),
            subtitle: const Text('Budget: \$300 - Deadline: 1 week'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to Job Detail Screen
            },
          ),
        ),
      ],
    );
  }
}
