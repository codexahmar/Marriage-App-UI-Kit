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
      imagePath: AppImages.onboarding1,
      tag: "💍 Serious Intentions",
      tagIcon: Icons.favorite_rounded,
      title: "Marriage, not casual dating",
      description:
          "A respectful space for practicing Muslims looking for a spouse who shares their values, lifestyle, and goals.",
    ),
    OnboardingModel(
      imagePath: AppImages.onboarding2,
      tag: "🔒 Privacy & Modesty",
      tagIcon: Icons.lock_outline_rounded,
      title: "Modesty and privacy first",
      description:
          "Full control over your visibility with photo privacy options, discreet browsing, and family chaperone support.",
    ),
    OnboardingModel(
      imagePath: AppImages.onboarding3,
      tag: "✨ Verified Community",
      tagIcon: Icons.verified_rounded,
      title: "Real people, verified profiles",
      description:
          "Every profile is selfie-verified with genuine background details so you can connect with complete peace of mind.",
    ),
  ];
}
