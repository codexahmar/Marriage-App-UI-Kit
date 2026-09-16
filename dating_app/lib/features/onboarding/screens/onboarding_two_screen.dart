import 'package:dating_app/features/onboarding/models/onboarding_model.dart';
import 'package:dating_app/features/onboarding/widgets/onboarding_content_widget.dart';
import 'package:flutter/material.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingContentWidget(
      model: OnboardingModel.defaultPages[1],
    );
  }
}
