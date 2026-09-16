import 'package:dating_app/core/widgets/app_snackbar.dart';
import 'package:dating_app/core/widgets/full_screen_image_viewer.dart';
import 'package:dating_app/features/explore/models/candidate_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateProfileHeader extends StatelessWidget {
  final CandidateModel candidate;

  const CandidateProfileHeader({
    super.key,
    required this.candidate,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final heroTag = 'candidate_photo_${candidate.name}';

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: screenHeight * 0.58,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.45),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 1.2,
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                AppSnackBar.showInfo(
                  context,
                  "Profile link copied to clipboard",
                );
              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.25),
                    width: 1.2,
                  ),
                ),
                child: const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Candidate Photo with Tap-to-Zoom & Hero
            GestureDetector(
              onTap: () {
                FullScreenImageViewer.open(
                  context,
                  heroTag: heroTag,
                  imagePath: candidate.image,
                  title: "${candidate.name}, ${candidate.age}",
                  subtitle: candidate.profession,
                );
              },
              child: Hero(
                tag: heroTag,
                child: Image.asset(
                  candidate.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Top gradient
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 120,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.65),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Match % & Vibe Floating Badges
            Positioned(
              bottom: 24,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.bolt_rounded,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${candidate.matchPercentage}% Match",
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      candidate.vibe,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
