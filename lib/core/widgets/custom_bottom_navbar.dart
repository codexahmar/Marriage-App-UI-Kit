import 'package:dating_app/controllers/nav_bar_controller.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarController = Provider.of<BottomNavBarController>(context);
    final currentIndex = navBarController.currentIndex;

    final List<_NavItemData> items = [
      const _NavItemData(
        label: 'Cards',
        icon: Icons.style_outlined,
        activeIcon: Icons.style_rounded,
      ),
      const _NavItemData(
        label: 'Matches',
        icon: Icons.favorite_outline_rounded,
        activeIcon: Icons.favorite_rounded,
      ),
      const _NavItemData(
        label: 'Chat',
        icon: Icons.chat_bubble_outline_rounded,
        activeIcon: Icons.chat_bubble_rounded,
      ),
      const _NavItemData(
        label: 'Profile',
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(
            color: Color(0xFFF0F2F5),
            width: 1.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = currentIndex == index;
              final item = items[index];

              return Expanded(
                child: InkWell(
                  onTap: () => navBarController.setIndex(index),
                  splashColor: AppColors.primary.withValues(alpha: 0.05),
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isSelected ? item.activeIcon : item.icon,
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.iconInactive,
                        size: 24,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11.5,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.iconInactive,
                          letterSpacing: -0.1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: isSelected ? 4 : 0,
                        height: 4,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _NavItemData({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
