import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/core/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _handleEmailSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.emailAuth);
  }

  void _handlePhoneSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verification);
  }

  void _handleSocialSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: Navigator.canPop(context),
        onBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 24.0,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(flex: 1),

                      // Brand Hero Section
                      Center(
                        child: Image.asset(
                          AppImages.logo,
                          height: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Human-crafted Warm Headline
                      Text(
                        "Start Something Real",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.8,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Engaging Subheadline
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Meet authentic people who share your vibe, lifestyle, and values.",
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

                      // Action Buttons
                      AppButton(
                        text: "Continue with email",
                        elevation: 3,
                        prefixIcon: const Icon(
                          Icons.mail_outline_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => _handleEmailSignUp(context),
                      ),
                      const SizedBox(height: 14),

                      AppButton(
                        text: "Use phone number",
                        isOutlined: true,
                        borderColor: AppColors.border,
                        prefixIcon: const Icon(
                          Icons.phone_iphone_rounded,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        textStyle: GoogleFonts.plusJakartaSans(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          letterSpacing: 0.2,
                        ),
                        onPressed: () => _handlePhoneSignUp(context),
                      ),

                      const SizedBox(height: 28),

                      // Divider with Badge
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.border,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              "or connect with",
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textMuted,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColors.border,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Social Authentication Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialAuthButton(
                            icon: Icons.facebook_rounded,
                            iconColor: AppColors.primary,
                            onTap: () => _handleSocialSignUp(context),
                          ),
                          const SizedBox(width: 16),
                          SocialAuthButton(
                            icon: Icons.apple_rounded,
                            iconColor: AppColors.primary,
                            onTap: () => _handleSocialSignUp(context),
                          ),
                          const SizedBox(width: 16),
                          SocialAuthButton(
                            icon: Icons.send_rounded,
                            iconColor: AppColors.primary,
                            onTap: () => _handleSocialSignUp(context),
                          ),
                        ],
                      ),

                      const Spacer(flex: 2),

                      // Terms of use and Privacy Policy with dot separator
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Terms of use",
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColors.primary,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: AppColors.textMuted,
                                shape: BoxShape.circle,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Privacy Policy",
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColors.primary,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
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
