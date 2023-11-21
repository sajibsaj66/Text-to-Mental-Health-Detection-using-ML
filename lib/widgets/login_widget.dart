// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, use_function_type_syntax_for_parameters, avoid_unnecessary_containers

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_constants.dart';
import 'package:mental/views/otp_verification.dart';
import 'package:mental/widgets/text_widget.dart';

Widget loginWidget(CountryCode countryCode, Function onCountryChange, Function onSubmit) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          text: AppConstants.helloNiceToMeetYou,
        ),
        textWidget(
            text: AppConstants.getMovingWithGreenTaxi,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 25,
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => onCountryChange(),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: countryCode.flagImage,
                          )),
                          textWidget(text: countryCode.dialCode),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  )),
              Container(
                width: 1,
                height: 55,
                color: Colors.black.withOpacity(0.5),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      onSubmitted:(String? input)=> onSubmit(input),
                      
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter your mobile number",
                        hintStyle: GoogleFonts.poppins(fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
              children: [
                const TextSpan(
                  text: AppConstants.byCreating + "   ",
                ),
                TextSpan(
                  text: AppConstants.termsOfService,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: AppConstants.privacyPolicy + "   ",
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
