import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum SetupActionType { friends, notifications }

class SetupActionScreen extends StatelessWidget {
  final SetupActionType type;
  final String? customTitle;
  final String? customSubtitle;
  final String? customImagePath;
  final String? customButtonText;
  final VoidCallback? onCustomAction;
  final VoidCallback? onCustomSkip;

  const SetupActionScreen({
    super.key,
    required this.type,
    this.customTitle,
    this.customSubtitle,
    this.customImagePath,
    this.customButtonText,
    this.onCustomAction,
    this.onCustomSkip,
  });

  const SetupActionScreen.friends({
    super.key,
    this.customTitle,
    this.customSubtitle,
    this.customImagePath,
    this.customButtonText,
    this.onCustomAction,
    this.onCustomSkip,
  }) : type = SetupActionType.friends;

  const SetupActionScreen.notifications({
    super.key,
    this.customTitle,
    this.customSubtitle,
    this.customImagePath,
    this.customButtonText,
    this.onCustomAction,
    this.onCustomSkip,
  }) : type = SetupActionType.notifications;

  void _handleFriendsAction(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notifications);
  }

  void _handleNotificationsAction(BuildContext context) {
    Provider.of<BottomNavBarController>(context, listen: false).setIndex(0);
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.explore,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isFriends = type == SetupActionType.friends;

    final String imagePath = customImagePath ??
        (isFriends ? AppImages.illustrationPeople : AppImages.illustrationChat);

    final String title = customTitle ??
        (isFriends ? "Search Friends" : "Enable Notifications");

    final String subtitle = customSubtitle ??
        (isFriends
            ? "You can find friends from your contact list to connect with and see who's already here."
            : "Get push notifications when you get a match or receive a new message in real time.");

    final String buttonText = customButtonText ??
        (isFriends ? "Access to contact list" : "I want to be notified");

    final VoidCallback onAction = onCustomAction ??
        (isFriends
            ? () => _handleFriendsAction(context)
            : () => _handleNotificationsAction(context));

    final VoidCallback onSkip = onCustomSkip ??
        (isFriends
            ? () => _handleFriendsAction(context)
            : () => _handleNotificationsAction(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: Navigator.canPop(context),
        showSkipButton: true,
        onSkip: onSkip,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 24.0,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(flex: 1),

                      // Illustrative Hero Image with subtle decorative halo
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryLight.withValues(alpha: 0.4),
                              ),
                            ),
                            Image.asset(
                              imagePath,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Title
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.6,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                            height: 1.45,
                          ),
                        ),
                      ),

                      const Spacer(flex: 2),

                      // Main Action Button
                      AppButton(
                        text: buttonText,
                        elevation: 3,
                        onPressed: onAction,
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
