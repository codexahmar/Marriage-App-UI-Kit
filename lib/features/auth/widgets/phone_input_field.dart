import 'package:country_code_picker/country_code_picker.dart';
import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String initialCountryCode;
  final ValueChanged<String> onCountryChanged;

  const PhoneInputField({
    super.key,
    required this.controller,
    required this.initialCountryCode,
    required this.onCountryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: 1.2),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (country) {
              if (country.dialCode != null) {
                onCountryChanged(country.dialCode!);
              }
            },
            initialSelection: 'PK',
            favorite: const ['PK', 'US', 'GB', 'IN', 'AE', 'CA', 'AU'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            padding: EdgeInsets.zero,
            builder: (countryCode) {
              return Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (countryCode?.flagUri != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          countryCode!.flagUri!,
                          package: 'country_code_picker',
                          width: 32,
                          height: 22,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      countryCode?.dialCode ?? initialCountryCode,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textMuted,
                      size: 20,
                    ),
                  ],
                ),
              );
            },
            dialogTextStyle: GoogleFonts.plusJakartaSans(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            searchDecoration: InputDecoration(
              hintText: 'Search country...',
              hintStyle: GoogleFonts.plusJakartaSans(
                color: AppColors.textMuted,
                fontSize: 14,
              ),
              prefixIcon: const Icon(Icons.search, color: AppColors.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
              ),
            ),
            searchStyle: GoogleFonts.plusJakartaSans(
              color: AppColors.textPrimary,
              fontSize: 15,
            ),
          ),
          const VerticalDivider(
            color: AppColors.divider,
            thickness: 1.2,
            width: 1.2,
            indent: 12,
            endIndent: 12,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '331 623 8141',
                hintStyle: GoogleFonts.plusJakartaSans(
                  color: AppColors.textMuted,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
