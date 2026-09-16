import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/custom_bottom_navbar.dart';
import 'package:dating_app/features/explore/models/candidate_model.dart';
import 'package:dating_app/features/explore/widgets/explore_filter_modal.dart';
import 'package:dating_app/features/explore/widgets/swipe_action_buttons.dart';
import 'package:dating_app/features/explore/widgets/swipe_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePeopleScreen extends StatefulWidget {
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  final CardSwiperController _cardSwiperController = CardSwiperController();
  final List<CandidateModel> _candidates = CandidateModel.defaultCandidates;

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  void _openCandidateDetails(CandidateModel candidate) {
    Navigator.pushNamed(
      context,
      AppRoutes.profile,
      arguments: candidate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushNamed(context, AppRoutes.profileDetails);
                }
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.border,
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Discover",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: AppColors.primary,
                  size: 13,
                ),
                const SizedBox(width: 4),
                Text(
                  "Chicago, IL",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  ExploreFilterModal.show(context);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.border,
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.tune_rounded,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 6),

            // Card Swiper Area with smooth card transitions
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CardSwiper(
                  controller: _cardSwiperController,
                  cardsCount: _candidates.length,
                  duration: const Duration(milliseconds: 650),
                  maxAngle: 25,
                  threshold: 50,
                  numberOfCardsDisplayed: 2,
                  isLoop: true,
                  backCardOffset: const Offset(0, -26),
                  scale: 0.95,
                  cardBuilder: (context, index, percentX, percentY) {
                    final candidate = _candidates[index];
                    return SwipeCardItem(
                      candidate: candidate,
                      percentX: percentX,
                      percentY: percentY,
                      onInfoTap: () => _openCandidateDetails(candidate),
                    );
                  },
                  allowedSwipeDirection: const AllowedSwipeDirection.only(
                    left: true,
                    right: true,
                    up: true,
                  ),
                  onSwipe: (previousIndex, current, direction) {
                    return true;
                  },
                ),
              ),
            ),

            // Elevated Swipe Action Buttons (Pass, Elevated Heart/Date in middle top, Super Like)
            SwipeActionButtons(
              onDislike: () {
                _cardSwiperController.swipe(CardSwiperDirection.left);
              },
              onStar: () {
                _cardSwiperController.swipe(CardSwiperDirection.top);
              },
              onLike: () {
                _cardSwiperController.swipe(CardSwiperDirection.right);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
