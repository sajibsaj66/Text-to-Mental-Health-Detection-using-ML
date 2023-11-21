// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, use_function_type_syntax_for_parameters, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_constants.dart';
// import 'package:mental/views/otp_verification.dart';
import 'package:mental/widgets/pinput_widget.dart';
import 'package:mental/widgets/text_widget.dart';

Widget otpVerificationWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          text: AppConstants.phoneVerification,
        ),
        textWidget(
            text: AppConstants.enterOtp,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 10,
        ),
        

        SizedBox(

          width: Get.width,
          height: 50,
          child: RoundedWithShadow()),

         const SizedBox(
          height: 30,
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
              children: [
                const TextSpan(
                  text: AppConstants.resendCode + " ",
                ),
                TextSpan(
                  text: "10 seconds",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
