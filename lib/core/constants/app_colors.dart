import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Palette
  static const Color primary = Color(0xFFE94057);
  static const Color primaryDark = Color(0xFFC72C41);
  static const Color primaryLight = Color(0xFFFFF0F2);
  static const Color secondary = Color(0xFFF27121);
  static const Color accent = Color(0xFF8A2387);

  // Backgrounds & Surfaces
  static const Color background = Colors.white;
  static const Color surface = Colors.white;
  static const Color surfaceElevated = Color(0xFFFAFAFA);
  static const Color cardBackground = Color(0xFFF4F4F6);

  // Typography
  static const Color textPrimary = Color(0xFF1B1B1E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Borders & Dividers
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocused = Color(0xFFE94057);
  static const Color divider = Color(0xFFF3F4F6);

  // Status & Actions
  static const Color iconColor = Color(0xFFE94057);
  static const Color iconInactive = Color(0xFF9CA3AF);
  static const Color success = Color(0xFF10B981);
  static const Color starGold = Color(0xFFF59E0B);
  static const Color dislikeBlue = Color(0xFF3B82F6);

  // Shadows
  static const Color shadow = Color(0x14000000);
  static const Color shadowActive = Color(0x33E94057);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFE94057), Color(0xFFF27121)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient romanticGradient = LinearGradient(
    colors: [Color(0xFFE94057), Color(0xFF8A2387)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0x20000000),
      Color(0x99000000),
      Color(0xE6000000),
    ],
    stops: [0.0, 0.4, 0.75, 1.0],
  );
}
