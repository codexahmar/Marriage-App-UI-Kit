import 'dart:io';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:dating_app/core/routes/app_routes.dart';
import 'package:dating_app/core/widgets/app_button.dart';
import 'package:dating_app/core/widgets/app_text_field.dart';
import 'package:dating_app/core/widgets/custom_app_bar.dart';
import 'package:dating_app/features/profile_setup/widgets/profile_photo_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  File? _image;
  DateTime? _selectedDate;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                textStyle: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        showBackButton: Navigator.canPop(context),
        showSkipButton: true,
        onSkip: () {
          Navigator.pushNamed(context, AppRoutes.gender);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Details",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.7,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Add your photo and basic info to start discovering matches.",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              // Profile Photo Picker
              ProfilePhotoPicker(
                image: _image,
                onPickImage: _pickImage,
              ),
              const SizedBox(height: 32),

              // Text Fields
              AppTextField(
                controller: _firstNameController,
                labelText: "First name",
                hintText: "Enter your first name",
              ),
              const SizedBox(height: 16),

              AppTextField(
                controller: _lastNameController,
                labelText: "Last name",
                hintText: "Enter your last name",
              ),
              const SizedBox(height: 16),

              // Birthday Picker Button
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                  decoration: BoxDecoration(
                    color: _selectedDate == null
                        ? AppColors.cardBackground
                        : AppColors.primaryLight.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _selectedDate == null
                          ? AppColors.border
                          : AppColors.primary.withValues(alpha: 0.4),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _selectedDate == null
                              ? AppColors.border.withValues(alpha: 0.5)
                              : AppColors.primaryLight,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.calendar_today_rounded,
                          color: _selectedDate == null
                              ? AppColors.textSecondary
                              : AppColors.primary,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'Choose your birth date'
                              : _formatDate(_selectedDate!),
                          style: GoogleFonts.plusJakartaSans(
                            color: _selectedDate == null
                                ? AppColors.textMuted
                                : AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: _selectedDate == null
                                ? FontWeight.w500
                                : FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: _selectedDate == null
                            ? AppColors.textMuted
                            : AppColors.primary,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              AppButton(
                text: "Confirm",
                elevation: 3,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.gender);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
