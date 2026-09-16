import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/widgets/app_snackbar.dart';
import 'package:dating_app/features/explore/models/candidate_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateActionBar extends StatelessWidget {
  final CandidateModel candidate;

  const CandidateActionBar({
    super.key,
    required this.candidate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).padding.bottom > 0
            ? MediaQuery.of(context).padding.bottom + 6
            : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(
            color: AppColors.divider,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Pass Button
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              AppSnackBar.showInfo(
                context,
                "Passed on ${candidate.name}",
              );
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.35),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFEF4444).withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xFFEF4444),
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Super Like Button
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              AppSnackBar.show(
                context,
                "Super Liked ${candidate.name}! ⭐",
                icon: Icons.star_rounded,
                iconColor: const Color(0xFF8A2387),
              );
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF8A2387).withValues(alpha: 0.35),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8A2387).withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.star_rounded,
                color: Color(0xFF8A2387),
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Send Like CTA Button
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  AppSnackBar.showMatch(
                    context,
                    "Sent a Like to ${candidate.name}! 💕",
                  );
                },
                icon: const Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(
                  "Send Like",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  shadowColor: AppColors.primary.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
