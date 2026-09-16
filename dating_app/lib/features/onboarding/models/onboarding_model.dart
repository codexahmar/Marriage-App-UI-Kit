import 'package:dating_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final String imagePath;
  final String tag;
  final IconData tagIcon;
  final String title;
  final String description;

  const OnboardingModel({
    required this.imagePath,
    required this.tag,
    required this.tagIcon,
    required this.title,
    required this.description,
  });

  static const List<OnboardingModel> defaultPages = [
    OnboardingModel(
      imagePath: AppImages.candidate2,
      tag: "Verified Profiles",
      tagIcon: Icons.verified_rounded,
      title: "Discover Real Connections",
      description:
          "Explore authentic profiles verified to ensure you meet genuine people who share your vibe and values.",
    ),
    OnboardingModel(
      imagePath: AppImages.candidate3,
      tag: "Meaningful Matches",
      tagIcon: Icons.favorite_rounded,
      title: "Match On What Matters",
      description:
          "Connect with people who share your passions, lifestyle, and values for deeper, lasting bonds.",
    ),
    OnboardingModel(
      imagePath: AppImages.candidate4,
      tag: "VIP Perks",
      tagIcon: Icons.workspace_premium_rounded,
      title: "Premium Experience",
      description:
          "Sign up today and unlock unlimited likes, instant matches, and spotlight perks on us.",
    ),
  ];
}
