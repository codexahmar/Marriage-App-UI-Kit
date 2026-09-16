import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeActionButtons extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      height: 118,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Base row for Left (Pass) and Right (Super Like) buttons on the exact same horizontal baseline
          Positioned(
            left: 0,
            right: 0,
            bottom: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Left Button: PASS
                _ScaleActionButton(
                  label: "PASS",
                  icon: Icons.close_rounded,
                  color: const Color(0xFFEF4444),
                  onTap: onDislike,
                  size: 60,
                  iconSize: 30,
                ),

                // Right Button: SUPER LIKE
                _ScaleActionButton(
                  label: "SUPER LIKE",
                  icon: Icons.star_rounded,
                  color: const Color(0xFF8A2387),
                  onTap: onStar,
                  size: 60,
                  iconSize: 30,
                ),
              ],
            ),
          ),

          // Center Button: Distinctly elevated higher DATE / LIKE Hero Button
          Positioned(
            top: 0,
            child: _ScaleActionButton(
              label: "DATE",
              icon: Icons.favorite_rounded,
              color: AppColors.primary,
              isHero: true,
              gradient: AppColors.primaryGradient,
              onTap: onLike,
              size: 78,
              iconSize: 38,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.45),
                  blurRadius: 22,
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

class _ScaleActionButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final bool isHero;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  const _ScaleActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.size,
    required this.iconSize,
    this.isHero = false,
    this.gradient,
    this.boxShadow,
  });

  @override
  State<_ScaleActionButton> createState() => _ScaleActionButtonState();
}

class _ScaleActionButtonState extends State<_ScaleActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 140),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.88).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.gradient == null ? Colors.white : null,
                gradient: widget.gradient,
                border: widget.gradient == null
                    ? Border.all(
                        color: widget.color.withValues(alpha: 0.28),
                        width: 1.5,
                      )
                    : null,
                boxShadow: widget.boxShadow ??
                    [
                      BoxShadow(
                        color: widget.color.withValues(alpha: 0.16),
                        blurRadius: 14,
                        offset: const Offset(0, 5),
                      ),
                    ],
              ),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: widget.isHero ? Colors.white : widget.color,
                  size: widget.iconSize,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: widget.isHero
                    ? AppColors.primaryLight
                    : widget.color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: widget.isHero ? 12 : 11,
                  fontWeight: FontWeight.w800,
                  color: widget.color,
                  letterSpacing: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
