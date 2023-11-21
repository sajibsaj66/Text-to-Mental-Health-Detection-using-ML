// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental/controller/auth_controller.dart';
import 'package:mental/utils/app_colors.dart';
// import 'package:mental/utils/app_constants.dart';
import 'package:mental/widgets/green_intro_widget.dart';

import '../widgets/otp_verfication_widget.dart';

class OtoVerificationScreen extends StatefulWidget {
  
  String phoneNumber;
  OtoVerificationScreen(this.phoneNumber);


  @override
  State<OtoVerificationScreen> createState() => _OtoVerificationScreenState();
}

class _OtoVerificationScreenState extends State<OtoVerificationScreen> {
 
 
  AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.phoneAuth(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                greenIntroWidget(),
                Positioned(
                  top: 60,
                  left: 30,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightColor,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.greenColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            otpVerificationWidget(),
          ],
        ),
      ),
    );
  }
}
