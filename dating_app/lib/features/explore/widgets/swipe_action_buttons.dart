import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeActionButtons extends StatefulWidget {
  final VoidCallback onDislike;
  final VoidCallback onLike;
  final VoidCallback onStar;
  final VoidCallback? onUndo;

  const SwipeActionButtons({
    super.key,
    required this.onDislike,
    required this.onLike,
    required this.onStar,
    this.onUndo,
  });

  @override
  State<SwipeActionButtons> createState() => _SwipeActionButtonsState();
}

class _SwipeActionButtonsState extends State<SwipeActionButtons> {
  Widget _buildActionButtonWithLabel({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required double size,
    required double iconSize,
    bool isHero = false,
    Gradient? gradient,
    List<BoxShadow>? boxShadow,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: gradient == null ? Colors.white : null,
              gradient: gradient,
              border: gradient == null
                  ? Border.all(
                      color: color.withValues(alpha: 0.28),
                      width: 1.5,
                    )
                  : null,
              boxShadow: boxShadow ??
                  [
                    BoxShadow(
                      color: color.withValues(alpha: 0.16),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: isHero ? Colors.white : color,
                size: iconSize,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: isHero
                  ? AppColors.primaryLight
                  : color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: isHero ? 12 : 11,
                fontWeight: FontWeight.w800,
                color: color,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 4.0, bottom: 8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Base row for Left (Pass) and Right (Super Like) buttons on the same horizontal line
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Left Button: PASS
                _buildActionButtonWithLabel(
                  label: "PASS",
                  icon: Icons.close_rounded,
                  color: const Color(0xFFEF4444),
                  onTap: widget.onDislike,
                  size: 58,
                  iconSize: 28,
                ),

                // Empty placeholder space for the elevated center heart button
                const SizedBox(width: 80),

                // Right Button: SUPER LIKE
                _buildActionButtonWithLabel(
                  label: "SUPER LIKE",
                  icon: Icons.star_rounded,
                  color: const Color(0xFF8A2387),
                  onTap: widget.onStar,
                  size: 58,
                  iconSize: 28,
                ),
              ],
            ),
          ),

          // Center Button: Elevated Top DATE / LIKE Hero Button
          Positioned(
            top: 0,
            child: _buildActionButtonWithLabel(
              label: "DATE",
              icon: Icons.favorite_rounded,
              color: AppColors.primary,
              isHero: true,
              gradient: AppColors.primaryGradient,
              onTap: widget.onLike,
              size: 72,
              iconSize: 34,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.45),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
