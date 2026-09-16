import 'dart:async';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/app_snackbar.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        if (mounted) {
          setState(() {
            _start--;
          });
        }
      }
    });
  }

  void _resendOtp() {
    _timer.cancel();
    _startTimer();
    AppSnackBar.showSuccess(context, "Verification code resent");
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Security Icon Badge
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.mark_email_read_outlined,
                  color: AppColors.primary,
                  size: 38,
                ),
              ),
              const SizedBox(height: 24),

              // Countdown Display
              Text(
                _start > 0
                    ? "00:${_start < 10 ? '0$_start' : _start}"
                    : "00:00",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 10),

              // Helper description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Type the verification code we've sent to your phone number.",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.5,
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 36),

              // PIN Code Fields
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                appContext: context,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(16),
                  fieldHeight: 56,
                  fieldWidth: 46,
                  activeFillColor: AppColors.primaryLight,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  activeColor: AppColors.primary,
                  inactiveColor: AppColors.border,
                  selectedColor: AppColors.primary,
                  borderWidth: 1.5,
                ),
                cursorColor: AppColors.primary,
                animationDuration: const Duration(milliseconds: 200),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                textStyle: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
                onChanged: (value) {
                  _otp = value;
                },
                onCompleted: (value) {
                  Navigator.pushNamed(context, AppRoutes.profileDetails);
                },
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 44),

              // Continue Button
              AppButton(
                text: "Continue",
                elevation: 3,
                suffixIcon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  if (_otp.length == 6 || _otp.isEmpty) {
                    Navigator.pushNamed(context, AppRoutes.profileDetails);
                  } else {
                    AppSnackBar.showError(context, "Please enter complete OTP");
                  }
                },
              ),

              const SizedBox(height: 24),

              // Resend Code Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: _start == 0 ? _resendOtp : null,
                    child: Text(
                      _start == 0 ? "Send again" : "Resend in ${_start}s",
                      style: GoogleFonts.plusJakartaSans(
                        color: _start == 0 ? AppColors.primary : AppColors.textMuted,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: _start == 0 ? TextDecoration.underline : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
