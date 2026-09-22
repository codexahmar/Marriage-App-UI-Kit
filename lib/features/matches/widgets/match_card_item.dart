import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/features/matches/models/match_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchCardItem extends StatelessWidget {
  final MatchModel match;
  final VoidCallback? onCancel;
  final VoidCallback? onLike;
  final VoidCallback? onTap;

  const MatchCardItem({
    super.key,
    required this.match,
    this.onCancel,
    this.onLike,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Photo
              Hero(
                tag: 'match_photo_${match.id}',
                child: Image.asset(
                  match.image,
                  fit: BoxFit.cover,
                ),
              ),

              // Bottom Vignette Gradient
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.15),
                        Colors.black.withValues(alpha: 0.85),
                      ],
                      stops: const [0.45, 0.70, 1.0],
                    ),
                  ),
                ),
              ),


              // Bottom Info and Action Buttons
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name, Age & Verified
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            match.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        Text(
                          ", ${match.age}",
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                          ),
                        ),
                        if (match.isVerified) ...[
                          const SizedBox(width: 3),
                          const Icon(
                            Icons.verified_rounded,
                            color: Color(0xFF3B82F6),
                            size: 13,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),

                    // Profession
                    Text(
                      match.profession,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Actions Row
                    Row(
                      children: [
                        // Pass button
                        Expanded(
                          child: GestureDetector(
                            onTap: onCancel,
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Like / Match Button
                        Expanded(
                          child: GestureDetector(
                            onTap: onLike,
                            child: Container(
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.favorite_rounded,
                                color: match.isLiked
                                    ? AppColors.primary
                                    : Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
