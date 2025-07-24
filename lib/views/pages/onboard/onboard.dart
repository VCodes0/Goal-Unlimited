import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goals_unlimited/views/auth/signup_login.dart';
import 'package:lottie_onboarding_screen/lottie_onboarding_screen.dart';

import '../../../main.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LottieOnboardingScreen(
        pages: [
          {
            'title': 'Set Your Goals Unlimited',
            'subtitle': 'Unlock Your Full Potential',
            'description':
                'Define clear, actionable goals and take control of your personal and professional growth.',
            'animation': "assets/lottie/onboard1.json",
            'gradient': [Color(0xFFF8BDEB), Color(0xFFB4E4FF)],
          },
          {
            'title': 'Track Your Progress',
            'subtitle': 'Stay Motivated Every Day',
            'description':
                'Monitor your achievements, overcome challenges, and celebrate milestones effortlessly.',
            'animation': "assets/lottie/Checklist.json",
            'gradient': [Color(0xFFB4E4FF), Color(0xFFBBF7D0)],
          },
          {
            'title': 'Achieve Beyond Limits',
            'subtitle': 'Your Success, Unlimited',
            'description':
                'Reach new heights with powerful tools designed to help you stay focused and inspired.',
            'animation': "assets/lottie/Business Analytics.json",
            'gradient': [Color(0xFFBBF7D0), Color(0xFFFDE68A)],
          },
        ],
        onSkip: () => Get.offAll(() => Signup()),
        onFinish: () => Get.offAll(() => Signup()),
        indicatorActiveColor: CupertinoColors.systemYellow,
        indicatorInactiveColor: Colors.grey,
        skipText: "Skip",
        nextText: "Next",
        startText: "Start",
        skipTextStyle: TextStyle(
          fontSize: mq.width * 0.035,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.systemYellow,
        ),
        buttonBackgroundColor: CupertinoColors.systemYellow,
        primaryColor: CupertinoColors.black,
        buttonBoxShadow: [
          BoxShadow(
            color: CupertinoColors.systemYellow.withAlpha(3),
            blurRadius: 20,
            offset: Offset(0, mq.height * 0.01),
          ),
        ],
        fontFamily: 'Gilroy',
      ),
    );
  }
}
