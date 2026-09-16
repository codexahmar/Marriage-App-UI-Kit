import 'package:dating_app/core/constants/app_assets.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/custom_bottom_navbar.dart';
import 'package:dating_app/features/explore/widgets/swipe_action_buttons.dart';
import 'package:dating_app/features/explore/widgets/swipe_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateData {
  final String image;
  final String name;
  final int age;
  final String profession;
  final String distance;
  final String bio;
  final String vibe;
  final List<String> interests;
  final int matchPercentage;
  final bool isVerified;

  const CandidateData({
    required this.image,
    required this.name,
    required this.age,
    required this.profession,
    required this.distance,
    required this.bio,
    required this.vibe,
    required this.interests,
    required this.matchPercentage,
    this.isVerified = true,
  });
}

class ExplorePeopleScreen extends StatefulWidget {
  const ExplorePeopleScreen({super.key});

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  final CardSwiperController _cardSwiperController = CardSwiperController();

  final List<CandidateData> _candidates = const [
    CandidateData(
      image: AppAssets.photoMain,
      name: "Jessica Parker",
      age: 23,
      profession: "Haute Couture Model",
      distance: "1.2 km away",
      bio:
          "Living between Chicago & NY. Always up for spontaneous road trips, art galleries & espresso.",
      vibe: "✨ Top Profile",
      interests: ["👗 Fashion", "🎨 Art History", "☕ Espresso", "✈️ Paris"],
      matchPercentage: 99,
    ),
    CandidateData(
      image: AppAssets.girl4,
      name: "Alice Vance",
      age: 22,
      profession: "Lifestyle Creator",
      distance: "2.4 km away",
      bio:
          "Finding the best hidden coffee roasters in the city. Golden hour enthusiast & indie music lover.",
      vibe: "⚡ Active Today",
      interests: [
        "📸 35mm Film",
        "☕ Specialty Coffee",
        "🌅 Sunsets",
        "🎵 Indie Pop"
      ],
      matchPercentage: 96,
    ),
    CandidateData(
      image: AppAssets.matches1,
      name: "Maya Lin",
      age: 23,
      profession: "Travel & Nature Photographer",
      distance: "3.2 km away",
      bio:
          "Living out of a backpack half the year. Sunset hikes, coastline drives, and film photography.",
      vibe: "🌿 Nature Lover",
      interests: [
        "🏔️ Hiking",
        "🌊 Coastlines",
        "📷 Film Camera",
        "🏕️ Camping"
      ],
      matchPercentage: 94,
    ),
    CandidateData(
      image: AppAssets.girl1,
      name: "Camille Laurent",
      age: 24,
      profession: "Avant-Garde Makeup Artist",
      distance: "4.0 km away",
      bio:
          "Editorial beauty & visual artist. Obsessed with gold glitter, moody cinema, and late-night talks.",
      vibe: "🔥 Creative Match",
      interests: ["✨ Glitter Art", "🎬 Cinema", "🎭 Theatre", "🍷 Wine Nights"],
      matchPercentage: 94,
    ),
    CandidateData(
      image: AppAssets.girl2,
      name: "Chloe Evans",
      age: 23,
      profession: "Fashion Consultant & Stylist",
      distance: "4.8 km away",
      bio:
          "Styling editorials & consulting. Minimalist aesthetics, French house music, and rooftop dinners.",
      vibe: "✨ Verified",
      interests: ["👠 Styling", "🍸 Rooftops", "🎶 House Music", "✈️ Milan"],
      matchPercentage: 93,
    ),
    CandidateData(
      image: AppAssets.girl3,
      name: "Roxie Wilde",
      age: 25,
      profession: "Indie Rock Lead & Musician",
      distance: "5.5 km away",
      bio:
          "Frontwoman for an indie band. Vinyl collector, emerald dresses, and midnight studio sessions.",
      vibe: "🎸 Rockstar Energy",
      interests: [
        "🎸 Electric Guitar",
        "⚡ Rock Music",
        "🖋️ Tattoos",
        "🎙️ Live Gigs"
      ],
      matchPercentage: 96,
    ),
    CandidateData(
      image: AppAssets.matches6,
      name: "Nadia Vane",
      age: 24,
      profession: "Editorial Fashion Model",
      distance: "6.2 km away",
      bio:
          "Vintage sunglasses collector, modern art lover, and creative direction enthusiast.",
      vibe: "✨ Trending",
      interests: [
        "🕶️ Vintage",
        "🦪 Pearls",
        "🎨 Modern Art",
        "🍸 Speakeasies"
      ],
      matchPercentage: 95,
    ),
    CandidateData(
      image: "assets/images/cardswipe1.png",
      name: "Ahmaryar Khan",
      age: 22,
      profession: "Mobile Software Engineer",
      distance: "3.5 km away",
      bio:
          "Building clean Flutter apps by day, playing strategy games & gym workouts by night.",
      vibe: "⚡ Fast Responder",
      interests: ["💻 Mobile Dev", "🎮 Gaming", "🏋️ Fitness", "🎧 Podcasts"],
      matchPercentage: 95,
    ),
  ];

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  void _openCandidateDetails(CandidateData candidate) {
    Navigator.pushNamed(context, AppRoutes.profile);
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
                onTap: () {},
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
                  duration: const Duration(milliseconds: 320),
                  cardBuilder: (context, index, percentX, percentY) {
                    final candidate = _candidates[index];
                    return SwipeCardItem(
                      imagePath: candidate.image,
                      name: candidate.name,
                      age: candidate.age,
                      profession: candidate.profession,
                      distance: candidate.distance,
                      bio: candidate.bio,
                      vibe: candidate.vibe,
                      interests: candidate.interests,
                      matchPercentage: candidate.matchPercentage,
                      isVerified: candidate.isVerified,
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
                  numberOfCardsDisplayed: 2,
                  isLoop: true,
                  backCardOffset: const Offset(0, -26),
                  scale: 0.95,
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
