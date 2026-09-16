import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityStoryAvatar extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isUnread;
  final bool isOnline;
  final VoidCallback? onTap;

  const ActivityStoryAvatar({
    super.key,
    required this.name,
    required this.imagePath,
    this.isUnread = false,
    this.isOnline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Clean Avatar with optional Unread Match Ring
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isUnread ? AppColors.primary : AppColors.border,
                      width: isUnread ? 2.2 : 1.2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.cardBackground,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),

                // Subtle Online Green Dot
                if (isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 64,
              child: Text(
                name,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: isUnread ? FontWeight.w700 : FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
