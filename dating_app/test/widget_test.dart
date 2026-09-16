import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/features/chats/screens/chats_screen.dart';
import 'package:dating_app/features/explore/screens/explore_people_screen.dart';
import 'package:dating_app/features/matches/screens/matches_screen.dart';
import 'package:dating_app/features/profile_setup/screens/gender_screen.dart';
import 'package:dating_app/features/profile_setup/screens/passions_screen.dart';
import 'package:dating_app/features/profile_setup/screens/profile_details_screen.dart';
import 'package:dating_app/features/profile_setup/screens/setup_action_screen.dart';
import 'package:dating_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('DatingApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BottomNavBarController(),
        child: const DatingApp(),
      ),
    );

    expect(find.byType(DatingApp), findsOneWidget);
    // Verify "Dating" header text is removed from the top bar
    expect(find.text("Dating"), findsNothing);
    // Verify "Skip" button is present
    expect(find.text("Skip"), findsOneWidget);
  });

  testWidgets('SetupActionScreen renders friends mode properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SetupActionScreen.friends(),
      ),
    );

    expect(find.text("Search Friends"), findsOneWidget);
    expect(find.text("Access to contact list"), findsOneWidget);
  });

  testWidgets('SetupActionScreen renders notifications mode properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SetupActionScreen.notifications(),
      ),
    );

    expect(find.text("Enable Notifications"), findsOneWidget);
    expect(find.text("I want to be notified"), findsOneWidget);
  });

  testWidgets('ProfileDetailsScreen renders properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileDetailsScreen(),
      ),
    );

    expect(find.text("Profile Details"), findsOneWidget);
    expect(find.text("Confirm"), findsOneWidget);
  });

  testWidgets('GenderScreen renders properly and handles selection',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GenderScreen(),
      ),
    );

    expect(find.text("I am a"), findsOneWidget);
    expect(find.text("Woman"), findsOneWidget);
    expect(find.text("Man"), findsOneWidget);
    expect(find.text("Continue"), findsOneWidget);
  });

  testWidgets('PassionsScreen renders properly with selectable interests',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PassionsScreen(),
      ),
    );

    expect(find.text("Your Interests"), findsOneWidget);
    expect(find.text("Travel"), findsOneWidget);
    expect(find.text("Continue"), findsOneWidget);
  });

  testWidgets('ExplorePeopleScreen renders app bar, cards and swipe action buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BottomNavBarController(),
        child: const MaterialApp(
          home: ExplorePeopleScreen(),
        ),
      ),
    );

    expect(find.text("Discover"), findsOneWidget);
    expect(find.text("Chicago, IL"), findsOneWidget);
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    expect(find.byIcon(Icons.star_rounded), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
  });

  testWidgets('ChatsScreen renders messages, stories and filters properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BottomNavBarController(),
        child: const MaterialApp(
          home: ChatsScreen(),
        ),
      ),
    );

    expect(find.text("Messages"), findsOneWidget);
    expect(find.text("New Matches"), findsOneWidget);
    expect(find.text("Conversations"), findsOneWidget);
    expect(find.text("Jessica Parker"), findsOneWidget);
    expect(find.text("Alice Vance"), findsOneWidget);
  });

  testWidgets('MatchesScreen renders matches, tabs and action cards',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BottomNavBarController(),
        child: const MaterialApp(
          home: MatchesScreen(),
        ),
      ),
    );

    expect(find.text("Matches"), findsNWidgets(2));
    expect(find.text("All (6)"), findsOneWidget);
    expect(find.text("Today (3)"), findsOneWidget);
    expect(find.text("Leilani, 19"), findsOneWidget);
    expect(find.text("Annabelle, 20"), findsOneWidget);
  });
}



