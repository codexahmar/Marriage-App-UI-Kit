import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/features/onboarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  final List<OnboardingModel> _pages = OnboardingModel.defaultPages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.72);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.signup);
    }
  }

  void _onSkip() {
    Navigator.pushNamed(context, AppRoutes.signup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableHeight = constraints.maxHeight;
            final carouselHeight = (availableHeight * 0.48).clamp(240.0, 390.0);

            return Column(
              children: [
                // Top Navigation Bar with Skip Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _onSkip,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Skip",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),

                // Center Image Carousel matching design screenshot (Side peek + center scale)
                SizedBox(
                  height: carouselHeight,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double page = _currentPage.toDouble();
                          if (_pageController.position.haveDimensions) {
                            page = _pageController.page ?? _currentPage.toDouble();
                          }
                          final double diff = (page - index).abs();
                          final double scale = (1.0 - (diff * 0.14)).clamp(0.86, 1.0);
                          final double opacity = (1.0 - (diff * 0.20)).clamp(0.78, 1.0);

                          return Transform.scale(
                            scale: scale,
                            child: Opacity(
                              opacity: opacity,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: diff < 0.5 ? 0.14 : 0.04,
                                      ),
                                      blurRadius: 22,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Image.asset(
                                    _pages[index].imagePath,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const Spacer(flex: 1),

                // Title & Subtitle Descriptions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          _pages[_currentPage].title,
                          key: ValueKey<int>(_currentPage),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.5,
                            height: 1.25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          _pages[_currentPage].description,
                          key: ValueKey<int>(_currentPage),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),

                // Bottom Control Area (Dots Indicator, Continue Button, Sign In Link)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Smooth Animated Page Indicator
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pages.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: AppColors.border,
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                          expansionFactor: 3.5,
                          spacing: 6.0,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Primary Action Button
                      AppButton(
                        text: _currentPage == _pages.length - 1
                            ? "Create an account"
                            : "Continue",
                        elevation: 3,
                        suffixIcon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: _onNext,
                      ),

                      const SizedBox(height: 14),

                      // Secondary Sign In Link
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signup);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
