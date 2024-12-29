import 'dart:async';

import 'package:budget_tracker_app/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offNamed(Routes.homePage);
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "lib/Views/SplashScreen/Assets/splash.json",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'PennyWise',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your smart budgeting companion',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
