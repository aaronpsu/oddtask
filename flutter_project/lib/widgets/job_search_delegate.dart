import 'package:flutter/material.dart';

class JobSearchDelegate extends SearchDelegate {
  final List<String> jobs = [
    'Freelancer Needed for Web Design',
    'Graphic Designer for Branding',
    'Full-stack Developer for Mobile App',
    'Content Writer for Blog',
    'SEO Specialist for Website Optimization',
    'UI/UX Designer for E-commerce Website',
  ];

  final List<String> recentJobs = [
    'Freelancer Needed for Web Design',
    'Graphic Designer for Branding',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> matchedJobs = jobs
        .where((job) => job.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchedJobs.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchedJobs[index]),
          onTap: () {
            // Add desired functionality for job selection
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
        ? recentJobs
        : jobs.where((job) => job.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
