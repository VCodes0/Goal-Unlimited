import 'dart:developer';
import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goals_unlimited/views/auth/otp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../main.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String completePhoneNumber = '';
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mq.height * 0.06),
              Text(
                isLogin ? "Welcome Back" : "Welcome",
                style: GoogleFonts.poppins(
                  color: Colors.yellow,
                  fontSize: mq.width * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                isLogin
                    ? "Login with your phone number"
                    : "Sign up with your phone number",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: mq.width * 0.045,
                ),
              ),
              SizedBox(height: mq.height * 0.05),
              Form(
                key: _formKey,
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.yellow,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                  style: const TextStyle(color: Colors.white),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    setState(() {
                      completePhoneNumber = phone.completeNumber;
                    });
                  },
                ),
              ),
              SizedBox(height: mq.height * 0.04),
              SizedBox(
                width: double.infinity,
                child: ActionSlider.standard(
                  backgroundColor: Colors.yellow,
                  toggleColor: Colors.black,
                  icon: const Icon(Icons.arrow_forward, color: Colors.yellow),
                  loadingIcon: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                  successIcon: const Icon(Icons.check, color: Colors.yellow),
                  failureIcon: const Icon(Icons.close, color: Colors.red),
                  action: (controller) async {
                    if (_formKey.currentState!.validate()) {
                      controller.loading();

                      await Future.delayed(const Duration(seconds: 1));

                      controller.success();

                      await Future.delayed(const Duration(milliseconds: 500));

                      // Navigate to OTP screen using GetX
                      Get.to(() => OtpScreen(phoneNumber: completePhoneNumber));

                      controller.reset();
                    } else {
                      controller.failure();
                      await Future.delayed(const Duration(seconds: 1));
                      controller.reset();
                    }
                  },
                  child: Text(
                    isLogin ? "Slide To Login" : "Slide To Sign Up",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: mq.width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.height * 0.03),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? "Don't have an account? Sign Up"
                        : "Already have an account? Login",
                    style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w500,
                      fontSize: mq.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
