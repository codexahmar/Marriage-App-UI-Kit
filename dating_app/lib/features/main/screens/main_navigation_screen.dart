import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/core/widgets/custom_bottom_navbar.dart';
import 'package:dating_app/features/chats/screens/chats_screen.dart';
import 'package:dating_app/features/explore/screens/explore_people_screen.dart';
import 'package:dating_app/features/matches/screens/matches_screen.dart';
import 'package:dating_app/features/profile/screens/profile_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  static const List<Widget> _screens = [
    ExplorePeopleScreen(),
    MatchesScreen(),
    ChatsScreen(),
    ProfileViewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navBarController = Provider.of<BottomNavBarController>(context);

    return Scaffold(
      body: IndexedStack(
        index: navBarController.currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
