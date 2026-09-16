import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final TextStyle? textStyle;
  final double elevation;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String? routeName;
  final Widget? destination;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isOutlined;
  final Color? borderColor;

  const AppButton({
    super.key,
    required this.text,
    this.color,
    this.gradient,
    this.textStyle,
    this.elevation = 0,
    this.width = double.infinity,
    this.height = 56,
    this.onPressed,
    this.routeName,
    this.destination,
    this.prefixIcon,
    this.suffixIcon,
    this.isOutlined = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = isOutlined
        ? null
        : (gradient ?? (color == null ? AppColors.primaryGradient : null));
    final effectiveColor = isOutlined ? Colors.transparent : (color ?? AppColors.primary);

    return Container(
      width: width == double.infinity ? null : width,
      height: height,
      decoration: BoxDecoration(
        color: effectiveGradient == null ? effectiveColor : null,
        gradient: effectiveGradient,
        borderRadius: BorderRadius.circular(20),
        border: isOutlined
            ? Border.all(color: borderColor ?? AppColors.primary, width: 1.5)
            : null,
        boxShadow: (!isOutlined && elevation > 0)
            ? const [
                BoxShadow(
                  color: AppColors.shadowActive,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            if (onPressed != null) {
              onPressed!();
            } else if (routeName != null) {
              Navigator.pushNamed(context, routeName!);
            } else if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination!),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  const SizedBox(width: 8),
                ],
                Text(
                  text,
                  style: textStyle ??
                      GoogleFonts.plusJakartaSans(
                        color: isOutlined ? (borderColor ?? AppColors.primary) : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: 0.2,
                      ),
                ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 8),
                  suffixIcon!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
