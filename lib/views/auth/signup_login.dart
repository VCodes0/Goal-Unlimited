import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import '../../main.dart';
import 'otp.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String completePhoneNumber = '';
  bool isLogin = false;
  bool isFinished = false;

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
                  color: CupertinoColors.systemYellow,
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
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemYellow,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: CupertinoColors.systemYellow,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                  style: const TextStyle(color: Colors.white),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    completePhoneNumber = phone.completeNumber;
                  },
                  validator: (phone) {
                    if (phone == null || phone.number.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: mq.height * 0.04),

              Center(
                child: SwipeableButtonView(
                  buttonText: isLogin ? "LOG IN" : "SIGN UP",
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  activeColor: CupertinoColors.systemYellow,
                  buttontextstyle: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 16,
                  ),
                  isFinished: isFinished,
                  onWaitingProcess: () async {
                    if (_formKey.currentState!.validate()) {
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        isFinished = true;
                      });
                    } else {
                      await Future.delayed(const Duration(milliseconds: 500));
                      setState(() {
                        isFinished = false;
                      });
                    }
                  },
                  onFinish: () async {
                    Get.to(() => OtpScreen(phoneNumber: completePhoneNumber));
                    setState(() {
                      isFinished = false;
                    });
                  },
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
