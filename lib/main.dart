import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goals_unlimited/views/pages/splash/splash_page.dart';

late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GetMaterialApp(
      title: 'Goals Unlimited',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: CupertinoColors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: CupertinoColors.systemYellow,
          foregroundColor: CupertinoColors.black,
          centerTitle: true,
          titleSpacing: 1,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const SplashPage(),
    );
  }
}
