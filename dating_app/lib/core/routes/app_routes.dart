import 'package:dating_app/features/auth/screens/email_auth_screen.dart';
import 'package:dating_app/features/auth/screens/otp_screen.dart';
import 'package:dating_app/features/auth/screens/signup_screen.dart';
import 'package:dating_app/features/auth/screens/verification_screen.dart';
import 'package:dating_app/features/chats/screens/chats_screen.dart';
import 'package:dating_app/features/explore/screens/candidate_profile_screen.dart';
import 'package:dating_app/features/explore/screens/explore_people_screen.dart';
import 'package:dating_app/features/matches/screens/matches_screen.dart';
import 'package:dating_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:dating_app/features/profile/screens/profile_view_screen.dart';
import 'package:dating_app/features/profile_setup/screens/gender_screen.dart';
import 'package:dating_app/features/profile_setup/screens/passions_screen.dart';
import 'package:dating_app/features/profile_setup/screens/profile_details_screen.dart';
import 'package:dating_app/features/profile_setup/screens/setup_action_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = '/';
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String emailAuth = '/email-auth';
  static const String verification = '/verification';
  static const String otp = '/otp';
  static const String profileDetails = '/profile-details';
  static const String gender = '/gender';
  static const String passions = '/passions';
  static const String friends = '/friends';
  static const String notifications = '/notifications';
  static const String explore = '/explore';
  static const String matches = '/matches';
  static const String chats = '/chats';
  static const String profile = '/profile';
  static const String candidateProfile = '/candidate-profile';

  static Map<String, WidgetBuilder> get routes {
    return {
      initialRoute: (context) => const OnboardingScreen(),
      onboarding: (context) => const OnboardingScreen(),
      signup: (context) => const SignUpScreen(),
      emailAuth: (context) => const EmailAuthScreen(),
      verification: (context) => const VerificationScreen(),
      otp: (context) => const OtpScreen(),
      profileDetails: (context) => const ProfileDetailsScreen(),
      gender: (context) => const GenderScreen(),
      passions: (context) => const PassionsScreen(),
      friends: (context) => const SetupActionScreen.friends(),
      notifications: (context) => const SetupActionScreen.notifications(),
      explore: (context) => const ExplorePeopleScreen(),
      matches: (context) => const MatchesScreen(),
      chats: (context) => const ChatsScreen(),
      profile: (context) => const ProfileViewScreen(),
      candidateProfile: (context) => const CandidateProfileScreen(),
    };
  }
}
