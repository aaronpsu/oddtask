import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notification_important),
          title: Text('You have a new message from Jane'),
          subtitle: Text('1 hour ago'),
        ),
        ListTile(
          leading: Icon(Icons.notification_important),
          title: Text('Your gig has been approved'),
          subtitle: Text('2 hours ago'),
        ),
      ],
    );
  }
}
