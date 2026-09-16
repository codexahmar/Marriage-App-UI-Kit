import 'package:dating_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showBackButton;
  final bool showSkipButton;
  final VoidCallback? onBack;
  final VoidCallback? onSkip;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.showBackButton = true,
    this.showSkipButton = false,
    this.onBack,
    this.onSkip,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primary,
                size: 20,
              ),
              onPressed: onBack ?? () => Navigator.pop(context),
            )
          : null,
      centerTitle: true,
      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                )
              : null),
      actions: [
        if (showSkipButton)
          TextButton(
            onPressed: onSkip ?? () => Navigator.pop(context),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }
}
