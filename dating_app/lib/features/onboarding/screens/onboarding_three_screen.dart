import 'package:dating_app/features/onboarding/models/onboarding_model.dart';
import 'package:dating_app/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

class OnboardingThreeScreen extends StatelessWidget {
  const OnboardingThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingContentWidget(
      model: OnboardingModel.defaultPages[2],
    );
  }
}
