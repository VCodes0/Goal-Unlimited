import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goals_unlimited/views/pages/onboard/onboard.dart';
import 'package:lottie/lottie.dart';

import '../../../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Get.offAll(() => Onboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Center(
        child: Lottie.asset(
          "assets/lottie/goals.json",
          height: mq.height * 0.4,
          width: mq.width * 0.8,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
