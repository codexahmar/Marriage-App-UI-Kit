import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/features/profile_setup/widgets/interest_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassionsScreen extends StatefulWidget {
  const PassionsScreen({super.key});

  @override
  State<PassionsScreen> createState() => _PassionsScreenState();
}

class _PassionsScreenState extends State<PassionsScreen> {
  final List<Map<String, dynamic>> interests = const [
    {"name": "Travel", "icon": Icons.flight_takeoff_rounded},
    {"name": "Music", "icon": Icons.music_note_rounded},
    {"name": "Sports", "icon": Icons.sports_basketball_rounded},
    {"name": "Cooking", "icon": Icons.restaurant_rounded},
    {"name": "Reading", "icon": Icons.menu_book_rounded},
    {"name": "Art", "icon": Icons.palette_outlined},
    {"name": "Gaming", "icon": Icons.videogame_asset_rounded},
    {"name": "Fitness", "icon": Icons.fitness_center_rounded},
    {"name": "Movies", "icon": Icons.movie_creation_outlined},
    {"name": "Photography", "icon": Icons.camera_alt_outlined},
    {"name": "Technology", "icon": Icons.devices_rounded},
    {"name": "Writing", "icon": Icons.edit_note_rounded},
    {"name": "Fashion", "icon": Icons.checkroom_rounded},
    {"name": "Swimming", "icon": Icons.pool_rounded},
  ];

  final Set<String> _selectedInterests = {"Travel", "Music", "Art"};

  void _toggleSelection(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: Navigator.canPop(context),
        showSkipButton: true,
        onSkip: () {
          Navigator.pushNamed(context, AppRoutes.friends);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Interests",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.7,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Select at least 3 interests to match with people who share your vibe.",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                  if (_selectedInterests.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "${_selectedInterests.length} picked",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: interests.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.7,
                  ),
                  itemBuilder: (context, index) {
                    final interest = interests[index];
                    final name = interest["name"] as String;
                    final icon = interest["icon"] as IconData;
                    final isSelected = _selectedInterests.contains(name);

                    return InterestGridItem(
                      name: name,
                      icon: icon,
                      isSelected: isSelected,
                      onTap: () => _toggleSelection(name),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: AppButton(
                  text: "Continue",
                  elevation: 3,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.friends);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
