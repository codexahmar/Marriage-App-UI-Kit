import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreFilterModal extends StatefulWidget {
  final String initialInterestedIn;
  final String initialLocation;
  final double initialDistance;
  final RangeValues initialAgeRange;
  final Function(String interestedIn, String location, double distance, RangeValues ageRange)? onApply;

  const ExploreFilterModal({
    super.key,
    this.initialInterestedIn = "Girls",
    this.initialLocation = "Islamabad, Pakistan",
    this.initialDistance = 40.0,
    this.initialAgeRange = const RangeValues(20, 28),
    this.onApply,
  });

  static void show(
    BuildContext context, {
    String initialInterestedIn = "Girls",
    String initialLocation = "Islamabad, Pakistan",
    double initialDistance = 40.0,
    RangeValues initialAgeRange = const RangeValues(20, 28),
    Function(String interestedIn, String location, double distance, RangeValues ageRange)? onApply,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ExploreFilterModal(
        initialInterestedIn: initialInterestedIn,
        initialLocation: initialLocation,
        initialDistance: initialDistance,
        initialAgeRange: initialAgeRange,
        onApply: onApply,
      ),
    );
  }

  @override
  State<ExploreFilterModal> createState() => _ExploreFilterModalState();
}

class _ExploreFilterModalState extends State<ExploreFilterModal> {
  late String _selectedInterestedIn;
  late String _location;
  late double _distance;
  late RangeValues _ageRange;

  final List<String> _interestedOptions = const ["Girls", "Boys", "Both"];

  @override
  void initState() {
    super.initState();
    _selectedInterestedIn = widget.initialInterestedIn;
    _location = widget.initialLocation;
    _distance = widget.initialDistance;
    _ageRange = widget.initialAgeRange;
  }

  void _resetFilters() {
    setState(() {
      _selectedInterestedIn = "Girls";
      _location = "Islamabad, Pakistan";
      _distance = 40.0;
      _ageRange = const RangeValues(20, 28);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 10.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top drag grabber
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1D5DB),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header: Filters (Centered) and Clear (Right)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 44), // balance spacer
                  Text(
                    "Filters",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.4,
                    ),
                  ),
                  GestureDetector(
                    onTap: _resetFilters,
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: 44,
                      child: Text(
                        "Clear",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 1. Interested in Section
              Text(
                "Interested in",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),

              // Segmented toggle container
              Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE8E6EA),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: List.generate(_interestedOptions.length, (index) {
                    final option = _interestedOptions[index];
                    final isSelected = _selectedInterestedIn == option;
                    final isLast = index == _interestedOptions.length - 1;
                    final nextIsSelected = !isLast &&
                        _selectedInterestedIn == _interestedOptions[index + 1];

                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedInterestedIn = option;
                                });
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  borderRadius: isSelected
                                      ? BorderRadius.circular(14)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    option,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14.5,
                                      fontWeight: isSelected
                                          ? FontWeight.w700
                                          : FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Vertical divider if neither this nor next item is selected
                          if (!isLast && !isSelected && !nextIsSelected)
                            Container(
                              height: 24,
                              width: 1,
                              color: const Color(0xFFE8E6EA),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),

              // 2. Location Section Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE8E6EA),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8C8C8C),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _location,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // 3. Distance Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Distance",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "${_distance.round()}km",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8C8C8C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: const Color(0xFFEBEBEB),
                  trackHeight: 4.0,
                  thumbColor: AppColors.primary,
                  overlayColor: AppColors.primary.withValues(alpha: 0.15),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 13.0,
                    elevation: 3,
                  ),
                ),
                child: Slider(
                  value: _distance,
                  min: 1,
                  max: 100,
                  onChanged: (val) {
                    setState(() {
                      _distance = val;
                    });
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 4. Age Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Age",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    "${_ageRange.start.round()}-${_ageRange.end.round()}",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8C8C8C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: const Color(0xFFEBEBEB),
                  trackHeight: 4.0,
                  thumbColor: AppColors.primary,
                  overlayColor: AppColors.primary.withValues(alpha: 0.15),
                  rangeThumbShape: const RoundRangeSliderThumbShape(
                    enabledThumbRadius: 13.0,
                    elevation: 3,
                  ),
                ),
                child: RangeSlider(
                  values: _ageRange,
                  min: 18,
                  max: 50,
                  onChanged: (values) {
                    setState(() {
                      _ageRange = values;
                    });
                  },
                ),
              ),

              const SizedBox(height: 24),

              // 5. Continue CTA Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onApply?.call(
                      _selectedInterestedIn,
                      _location,
                      _distance,
                      _ageRange,
                    );
                    Navigator.pop(context);
                    AppSnackBar.showSuccess(
                      context,
                      "Filters applied ($_selectedInterestedIn, ${_distance.round()}km, ${_ageRange.start.round()}-${_ageRange.end.round()})",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
