import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goals_unlimited/views/pages/home/home.dart';
import 'package:pinput/pinput.dart';

import '../../main.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpScreen({required this.phoneNumber, super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = mq.width < 360;

    final defaultPinTheme = PinTheme(
      width: mq.width * 0.12,
      height: mq.width * 0.12,
      textStyle: TextStyle(
        fontSize: isSmallScreen ? 16 : 20,
        color: Colors.yellow,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.yellow),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * 0.06,
          vertical: mq.height * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "OTP sent to",
              style: TextStyle(
                color: Colors.white70,
                fontSize: isSmallScreen ? 14 : 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              phoneNumber,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: isSmallScreen ? 18 : 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: mq.height * 0.05),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.white),
                ),
              ),
              onCompleted: (pin) => Get.to(() => Home()),
            ),
            SizedBox(height: mq.height * 0.03),
            TextButton(
              onPressed: () {
                Get.snackbar(
                  "OTP",
                  "OTP resent to $phoneNumber",
                  backgroundColor: Colors.white10,
                  colorText: Colors.yellow,
                );
              },
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: isSmallScreen ? 14 : 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
