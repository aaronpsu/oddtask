import 'dart:async';

import 'package:flutter/material.dart';
import 'job_feed_screen.dart';
import 'create_gig_screen.dart';
import 'chat_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const JobFeedScreen(),
    const CreateGigScreen(),
    const ChatScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            _currentIndex == 0
                ? "ODD TASK"
                : ["Jobs", "Create Gig", "Chat", "Notifications", "Profile"][_currentIndex],
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          if (_currentIndex == 0)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              setState(() {
                _currentIndex = 4;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const AdvertisementContainer(),
          Expanded(child: _screens[_currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class AdvertisementContainer extends StatefulWidget {
  const AdvertisementContainer({super.key});

  @override
  _AdvertisementContainerState createState() => _AdvertisementContainerState();
}

class _AdvertisementContainerState extends State<AdvertisementContainer> {
  final List<String> _ads = [
    'assets/images/ads/ad1.jpg',
    'assets/images/ads/ad2.jpg',
    'assets/images/ads/ad3.jpg',
  ];
  final Color _defaultColor = Colors.blue.shade100;
  int _currentAdIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentAdIndex = (_currentAdIndex + 1) % (_ads.length + 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _currentAdIndex == _ads.length ? _defaultColor : null,
        image: _currentAdIndex < _ads.length
            ? DecorationImage(
                image: AssetImage(_ads[_currentAdIndex]),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Center(
        child: _currentAdIndex == _ads.length
            ? const Text(
                "Advertisement",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            : null,
      ),
    );
  }
}
