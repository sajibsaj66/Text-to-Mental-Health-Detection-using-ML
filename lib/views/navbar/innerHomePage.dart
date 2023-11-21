// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/Mental%20Expert/homepage.dart';
import 'package:mental/appointmentpolicy.dart';
import 'package:mental/utils/app_colors.dart';
import '../../BMI/bmi.dart';
import '../carousel.dart';

class iHomepage extends StatefulWidget {
  const iHomepage({super.key});

  @override
  State<iHomepage> createState() => _iHomepageState();
}

class _iHomepageState extends State<iHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/bet.svg'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 16, top: 16),
              child: Text(
                'Hey, majharul!👋 This promos for You!',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),

              // child: Carousel(),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Carousel(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 24, top: 20),
              child: Text(
                'Facilites',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: AppColors.greenColor, width: 1),
                          ),

                          child: Row(
                            children: [
                              Image.asset('assets/mental-health.png'),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: GestureDetector(
                                  
                                  onTap: () {
                                     Get.to(() => const MHomePage());
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Mental  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        ' Expert  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                                     Get.to(() => const BmiPage());
                                  },

                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 50,
                                    color: AppColors.whiteColor,
                                    spreadRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.greenColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/bmi.png'),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '  BMI  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        ' Expert  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (() {
                             Get.to(() => const AppoimentPolicy());
                          }),
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.greenColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/medical-appointment.png'),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Appoinment',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        ' Policy  ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 50,
                                  color: AppColors.whiteColor,
                                  spreadRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: AppColors.greenColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/rate.png'),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rating  ',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      ' Point  ',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Doctors',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("doctor")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final snap = snapshot.data!.docs;
                            return ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: snap.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 70,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                   color: Color.fromARGB(255, 44, 188, 214),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(2, 2),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      snap[index]['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(fontSize: 18),
                                    ),
                                    subtitle: Text(snap[index]['specialist ']),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(snap[index]['image']),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
