import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/features/auth/widgets/phone_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = '+92';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onContinue() {
    Navigator.pushNamed(context, AppRoutes.otp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: true,
        showSkipButton: true,
        onSkip: () {
          Navigator.pushNamed(context, AppRoutes.profileDetails);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                "My Mobile",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.7,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Please enter your valid phone number. We will send you a 6-digit code to verify your account.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.5,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              PhoneInputField(
                controller: _phoneController,
                initialCountryCode: _countryCode,
                onCountryChanged: (code) {
                  setState(() {
                    _countryCode = code;
                  });
                },
              ),
              const SizedBox(height: 48),
              AppButton(
                text: "Continue",
                elevation: 3,
                suffixIcon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: _onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
