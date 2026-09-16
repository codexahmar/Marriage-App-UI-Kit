import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/widgets/app_snackbar.dart';
import 'package:dating_app/features/explore/models/candidate_model.dart';
import 'package:dating_app/features/explore/widgets/candidate_action_bar.dart';
import 'package:dating_app/features/explore/widgets/candidate_profile_header.dart';
import 'package:dating_app/features/explore/widgets/candidate_prompt_card.dart';
import 'package:dating_app/features/explore/widgets/interest_chip_list.dart';
import 'package:dating_app/features/explore/widgets/profile_gallery_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateProfileScreen extends StatelessWidget {
  final CandidateModel? candidate;

  const CandidateProfileScreen({
    super.key,
    this.candidate,
  });

  static const List<String> _galleryImages = [
    AppImages.gallery1,
    AppImages.gallery2,
    AppImages.gallery3,
    AppImages.gallery4,
    AppImages.gallery5,
  ];

  Widget _buildFactChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveCandidate = candidate ??
        (ModalRoute.of(context)?.settings.arguments as CandidateModel?) ??
        CandidateModel.defaultCandidates.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1. Modular Header with Photo, Hero, Badges, and Controls
          CandidateProfileHeader(candidate: effectiveCandidate),

          // 2. Profile Details Sheet
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 100),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    spreadRadius: 2,
                    blurRadius: 16,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Name, Age, Verified & Chat Action
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "${effectiveCandidate.name}, ${effectiveCandidate.age}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 26,
                                  color: AppColors.textPrimary,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                            if (effectiveCandidate.isVerified) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3B82F6),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 13,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppSnackBar.showSuccess(
                            context,
                            "Direct message sent to ${effectiveCandidate.name}",
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.25),
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(
                            Icons.send_rounded,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Profession & Distance
                  Row(
                    children: [
                      const Icon(
                        Icons.work_outline_rounded,
                        color: AppColors.textSecondary,
                        size: 15,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        effectiveCandidate.profession,
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textSecondary,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.textSecondary,
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        effectiveCandidate.distance,
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textSecondary,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Quick Facts Capsules Row
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildFactChip(Icons.straighten_rounded, "5'8 (173 cm)"),
                      _buildFactChip(Icons.auto_awesome_rounded, "Virgo"),
                      _buildFactChip(Icons.wine_bar_rounded, "Social Drinker"),
                      _buildFactChip(Icons.fitness_center_rounded, "Active Lifestyle"),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // About Section
                  Text(
                    "About",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    effectiveCandidate.bio,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textSecondary,
                      fontSize: 14.5,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Conversation Starter Prompt Card
                  const CandidatePromptCard(
                    question: "My simple pleasures in life...",
                    answer:
                        "Exploring hidden vinyl record shops, catching sunset views over the skyline, and brewing specialty pourover coffee on lazy Sundays.",
                  ),
                  const SizedBox(height: 24),

                  // Interests Section
                  Text(
                    "Interests",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  InterestChipList(interests: effectiveCandidate.interests),
                  const SizedBox(height: 28),

                  // Gallery Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gallery",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Text(
                        "5 Photos",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textSecondary,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const ProfileGalleryGrid(images: _galleryImages),
                  const SizedBox(height: 24),

                  // Verification Trust Badge
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.verified_user_rounded,
                          color: Color(0xFF3B82F6),
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profile Verified",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Photos & identity confirmed with selfie verification.",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // 3. Bottom Sticky Action Bar
      bottomNavigationBar: CandidateActionBar(candidate: effectiveCandidate),
    );
  }
}
