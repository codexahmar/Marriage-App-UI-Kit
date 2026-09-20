import 'dart:math' as math;
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/features/explore/models/candidate_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeCardItem extends StatelessWidget {
  final CandidateModel candidate;
  final int percentX;
  final int percentY;
  final VoidCallback? onInfoTap;

  const SwipeCardItem({
    super.key,
    required this.candidate,
    this.percentX = 0,
    this.percentY = 0,
    this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = candidate.image;
    final name = candidate.name;
    final age = candidate.age;
    final profession = candidate.profession;
    final isVerified = candidate.isVerified;

    // Calculate real-time swipe stamp opacity based on drag progress
    final double likeOpacity = (percentX / 25).clamp(0.0, 1.0);
    final double nopeOpacity = (-percentX / 25).clamp(0.0, 1.0);
    final double starOpacity = (-percentY / 25).clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Candidate Photo
            Hero(
              tag: 'candidate_photo_${candidate.name}',
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.cardBackground,
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ),

            // 2. Multi-stop Deep Gradient at Bottom for ultra-crisp typography
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.35),
                        Colors.black.withValues(alpha: 0.78),
                        Colors.black.withValues(alpha: 0.96),
                      ],
                      stops: const [0.0, 0.40, 0.60, 0.80, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            // 5. Dynamic Real-time Swipe Stamps
            // (a) DATE / LIKE Stamp (Swiping Right)
            if (likeOpacity > 0.05)
              Positioned(
                top: 60,
                left: 20,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: likeOpacity,
                    child: Transform.rotate(
                      angle: -15 * math.pi / 180,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFF10B981),
                            width: 3.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.favorite_rounded,
                              color: Color(0xFF10B981),
                              size: 26,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "DATE",
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFF10B981),
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // (b) PASS / NOPE Stamp (Swiping Left)
            if (nopeOpacity > 0.05)
              Positioned(
                top: 60,
                right: 20,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: nopeOpacity,
                    child: Transform.rotate(
                      angle: 15 * math.pi / 180,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFEF4444),
                            width: 3.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.close_rounded,
                              color: Color(0xFFEF4444),
                              size: 26,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "PASS",
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xFFEF4444),
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // (c) SUPER LIKE Stamp (Swiping Up)
            if (starOpacity > 0.05)
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: Center(
                    child: Opacity(
                      opacity: starOpacity,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF8A2387), Color(0xFFF59E0B)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8A2387).withValues(alpha: 0.6),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "SUPER LIKE",
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // 6. Rich Bottom Candidate Profile Information
            Positioned(
              bottom: 18,
              left: 18,
              right: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Candidate Name, Age, Verified badge & Profile Info Button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "$name, $age",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.6,
                                ),
                              ),
                            ),
                            if (isVerified) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.all(2.5),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3B82F6),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (onInfoTap != null)
                        GestureDetector(
                          onTap: onInfoTap,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.22),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.45),
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Profession (Full Width & Clean)
                  Row(
                    children: [
                      Icon(
                        Icons.work_outline_rounded,
                        color: Colors.white.withValues(alpha: 0.9),
                        size: 15,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          profession,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white.withValues(alpha: 0.95),
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Short Bio / Prompt Snippet
                  if (candidate.displayShortBio.isNotEmpty)
                    Text(
                      candidate.displayShortBio,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white.withValues(alpha: 0.88),
                        fontSize: 13,
                        height: 1.35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
