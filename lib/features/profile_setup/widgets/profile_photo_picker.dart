import 'dart:io';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePhotoPicker extends StatelessWidget {
  final File? image;
  final VoidCallback onPickImage;

  const ProfilePhotoPicker({
    super.key,
    required this.image,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPickImage,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: image == null
                    ? AppColors.primaryLight.withValues(alpha: 0.5)
                    : AppColors.cardBackground,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: image == null
                      ? AppColors.primary.withValues(alpha: 0.3)
                      : AppColors.border,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: image == null
                        ? AppColors.primary.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryLight,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add_a_photo_rounded,
                            color: AppColors.primary,
                            size: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Upload Photo",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13.5,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
            ),
            Positioned(
              bottom: -4,
              right: -4,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  image == null ? Icons.add_rounded : Icons.edit_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
