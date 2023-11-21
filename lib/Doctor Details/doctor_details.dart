// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_colors.dart';

class DoctorDetatls extends StatefulWidget {
  const DoctorDetatls({super.key});

  @override
  State<DoctorDetatls> createState() => _DoctorDetatlsState();
}

class _DoctorDetatlsState extends State<DoctorDetatls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Doctor Information'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image part
              Container(
                height: MediaQuery.of(context).size.height * .30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/R.2f0094500edb8892e60769e4271ec0d3?rik=BoPzMIV6CP8w0w&pid=ImgRaw&r=0')),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 114, 184, 255),
                      spreadRadius: 1,
                      blurRadius: 8,
                    )
                  ],
                ),
              ),

              //description part

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dr. Jahangir Talukder',
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Row(
                        children: [
                          // Icon(Icons.star_border_rounded),
                          Image.asset('assets/star.png'),
                          Text('24hrs',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More Details:',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'MBBS, MCPS, MPHIL (Psychiatry), MMEd, Fellow Child Psychiatry (Pakistan), MACP (USA), FRCP (UK)',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contact: 0179811512',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Location: Basundhara R/A',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 80,
              ),

              GestureDetector(
                onTap: (() {
                  Get.snackbar('Thank you!', 'team Better Aid');
                }),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.purple,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(-4, 4),
                      )
                    ],
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Get.snackbar('Thanks for your patient', 'BetterAid');
                      },
                      child: const Center(child: Text('Stay connect with us'))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
