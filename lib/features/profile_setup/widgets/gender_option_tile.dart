import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderOptionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isDropdownTrigger;
  final bool isExpanded;
  final VoidCallback onTap;

  const GenderOptionTile({
    super.key,
    required this.title,
    required this.isSelected,
    this.isDropdownTrigger = false,
    this.isExpanded = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryLight.withValues(alpha: 0.6)
              : AppColors.cardBackground.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                letterSpacing: 0.1,
              ),
            ),
            if (isDropdownTrigger)
              AnimatedRotation(
                turns: isExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: isSelected ? AppColors.primary : AppColors.textMuted,
                  size: 24,
                ),
              )
            else
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.textMuted.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : null,
              ),
          ],
        ),
      ),
    );
  }
}
