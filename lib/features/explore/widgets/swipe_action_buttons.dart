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
      height: 116,
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
                // Left Button: PASS (3D Neumorphic)
                _NeumorphicActionButton(
                  label: "PASS",
                  icon: Icons.close_rounded,
                  iconColor: const Color(0xFFEF4444),
                  onTap: onDislike,
                  size: 60,
                  iconSize: 28,
                ),

                // Right Button: SUPER LIKE (3D Neumorphic)
                _NeumorphicActionButton(
                  label: "SUPER LIKE",
                  icon: Icons.star_rounded,
                  iconColor: const Color(0xFF8A2387),
                  onTap: onStar,
                  size: 60,
                  iconSize: 28,
                ),
              ],
            ),
          ),

          // Center Button: Distinctly elevated higher DATE / LIKE Hero Button (3D Neumorphic)
          Positioned(
            top: 0,
            child: _NeumorphicActionButton(
              label: "DATE",
              icon: Icons.favorite_rounded,
              iconColor: AppColors.primary,
              isHero: true,
              onTap: onLike,
              size: 78,
              iconSize: 38,
            ),
          ),
        ],
      ),
    );
  }
}

class _NeumorphicActionButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final bool isHero;

  const _NeumorphicActionButton({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.size,
    required this.iconSize,
    this.isHero = false,
  });

  @override
  State<_NeumorphicActionButton> createState() =>
      _NeumorphicActionButtonState();
}

class _NeumorphicActionButtonState extends State<_NeumorphicActionButton>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.90).animate(
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
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 3D Neumorphic Elevated Circle
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Color(0xFFF6F7FB),
                    Color(0xFFE9EBF1),
                  ],
                  stops: [0.0, 0.55, 1.0],
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                boxShadow: [
                  // Top-left bright specular reflection / 3D highlight
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  // Bottom-right soft depth shadow for tactile extrusion
                  BoxShadow(
                    color: const Color(0xFFB8BCC8).withValues(alpha: 0.55),
                    offset: const Offset(5, 6),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                // Subtle inner 3D disc to enhance depth
                child: Container(
                  width: widget.size - 8,
                  height: widget.size - 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFF9FAFC),
                        Colors.white.withValues(alpha: 0.9),
                        const Color(0xFFECEEF4),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      widget.icon,
                      color: widget.iconColor,
                      size: widget.iconSize,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Clean Label with no container and neutral color
            Text(
              widget.label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: widget.isHero ? 12 : 11,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
