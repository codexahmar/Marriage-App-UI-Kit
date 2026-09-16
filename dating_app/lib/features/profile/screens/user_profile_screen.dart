import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: "User Profile",
        showBackButton: true,
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            AppAssets.photoMain,
            width: 300,
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
