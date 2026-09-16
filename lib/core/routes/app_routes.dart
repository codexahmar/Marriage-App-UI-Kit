import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/features/auth/screens/email_auth_screen.dart';
import 'package:dating_app/features/auth/screens/otp_screen.dart';
import 'package:dating_app/features/auth/screens/signup_screen.dart';
import 'package:dating_app/features/auth/screens/verification_screen.dart';
import 'package:dating_app/features/explore/screens/candidate_profile_screen.dart';
import 'package:dating_app/features/main/screens/main_navigation_screen.dart';
import 'package:dating_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:dating_app/features/profile_setup/screens/gender_screen.dart';
import 'package:dating_app/features/profile_setup/screens/passions_screen.dart';
import 'package:dating_app/features/profile_setup/screens/profile_details_screen.dart';
import 'package:dating_app/features/profile_setup/screens/setup_action_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      explore: (context) => const MainNavigationScreen(),
      matches: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Provider.of<BottomNavBarController>(context, listen: false).setIndex(1);
        });
        return const MainNavigationScreen();
      },
      chats: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Provider.of<BottomNavBarController>(context, listen: false).setIndex(2);
        });
        return const MainNavigationScreen();
      },
      profile: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Provider.of<BottomNavBarController>(context, listen: false).setIndex(3);
        });
        return const MainNavigationScreen();
      },
      candidateProfile: (context) => const CandidateProfileScreen(),
    };
  }
}
