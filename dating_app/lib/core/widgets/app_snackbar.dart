import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSnackBar {
  AppSnackBar._();

  static void show(
    BuildContext context,
    String message, {
    IconData icon = Icons.info_outline_rounded,
    Color iconColor = AppColors.primary,
    Duration duration = const Duration(milliseconds: 2500),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        padding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E28),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.12),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 16.0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 18.0,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  message,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        action: action,
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    show(
      context,
      message,
      icon: Icons.check_circle_rounded,
      iconColor: const Color(0xFF10B981),
    );
  }

  static void showInfo(BuildContext context, String message) {
    show(
      context,
      message,
      icon: Icons.info_rounded,
      iconColor: AppColors.primary,
    );
  }

  static void showError(BuildContext context, String message) {
    show(
      context,
      message,
      icon: Icons.error_outline_rounded,
      iconColor: const Color(0xFFEF4444),
    );
  }

  static void showMatch(BuildContext context, String message) {
    show(
      context,
      message,
      icon: Icons.favorite_rounded,
      iconColor: AppColors.primary,
    );
  }
}
