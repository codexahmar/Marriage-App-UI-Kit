import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color iconColor;
  final double size;
  final double iconSize;

  const SocialAuthButton({
    super.key,
    required this.icon,
    this.onTap,
    this.iconColor = AppColors.primary,
    this.size = 60,
    this.iconSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
