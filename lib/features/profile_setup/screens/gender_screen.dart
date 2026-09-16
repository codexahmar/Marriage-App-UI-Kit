import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/features/profile_setup/widgets/gender_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String _selectedGender = "Woman";
  bool _showDropdown = false;
  final List<String> _otherGenders = [
    "Transgender",
    "Bigender",
    "Non-binary",
    "Other"
  ];

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
      _showDropdown = false;
    });
  }

  void _toggleDropdown() {
    setState(() {
      _showDropdown = !_showDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isOtherSelected = _otherGenders.contains(_selectedGender);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: Navigator.canPop(context),
        showSkipButton: true,
        onSkip: () {
          Navigator.pushNamed(context, AppRoutes.passions);
        },
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 24.0,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I am a",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.7,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Select your gender to help us personalize your experience.",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 36),

                      GenderOptionTile(
                        title: "Woman",
                        isSelected: _selectedGender == "Woman",
                        onTap: () => _selectGender("Woman"),
                      ),
                      GenderOptionTile(
                        title: "Man",
                        isSelected: _selectedGender == "Man",
                        onTap: () => _selectGender("Man"),
                      ),
                      GenderOptionTile(
                        title: isOtherSelected
                            ? _selectedGender
                            : "Choose Another",
                        isSelected: isOtherSelected,
                        isDropdownTrigger: true,
                        isExpanded: _showDropdown,
                        onTap: _toggleDropdown,
                      ),

                      // Animated Expandable Container for Other Genders
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                          child: Material(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(18),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: _otherGenders.map((gender) {
                                final isOptionSelected =
                                    _selectedGender == gender;
                                return InkWell(
                                  onTap: () => _selectGender(gender),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 14,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          gender,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: isOptionSelected
                                                ? AppColors.primary
                                                : AppColors.textPrimary,
                                            fontWeight: isOptionSelected
                                                ? FontWeight.w700
                                                : FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        if (isOptionSelected)
                                          const Icon(
                                            Icons.check_circle_rounded,
                                            color: AppColors.primary,
                                            size: 20,
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        crossFadeState: _showDropdown
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 250),
                      ),

                      const Spacer(),

                      AppButton(
                        text: "Continue",
                        elevation: 3,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.passions);
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
