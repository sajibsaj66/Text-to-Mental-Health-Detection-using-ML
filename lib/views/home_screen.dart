// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mental/views/my_profile.dart';
import 'package:mental/views/navbar/alldoctors.dart';
import 'package:mental/views/navbar/innerHomePage.dart';
import 'package:mental/views/navbar/settings.dart';

import '../controller/auth_controller.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.find<AuthController>();
  int _currentIndex = 0;

  final screens = [
    iHomepage(),
    AllDoctor(),
    settings(),
  ];

  @override
  void initState() {
    super.initState();
    authController.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      // appBar: AppBar(
      //   title: const Text('Finda Doctor'),
      //   // automaticallyImplyLeading: false,
      //   centerTitle: true,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        type: BottomNavigationBarType.fixed,

        // backgroundColor: Colors.lightBlueAccent,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.add_home_work_sharp),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.ads_click),
              activeIcon: Icon(Icons.content_paste_search_sharp),
              label: 'All Doctors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              // activeIcon: Icon(Icons.home_filled),
              label: 'Settings'),
        ],
        onTap: ((value) {
          setState(() {
            _currentIndex = value;
          });
        }),
      ),
      body: screens[_currentIndex],
    );
  }

  buildDrawer() {
    return Drawer(
      // backgroundColor:Colors.blueAccent,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const MyProfile());
            },
            child: SizedBox(
              height: 150,
              child: DrawerHeader(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // image: authController.myUser.value.image ==null? DecorationImage(
                        //   image: AssetImage('assets/person.png'),
                        //   fit: BoxFit.fill,
                        // ): DecorationImage()
                        image: authController.myUser.value.image == null
                            ? const DecorationImage(
                                image: AssetImage('assets/person.png'),
                                fit: BoxFit.fill)
                            : DecorationImage(
                                image: NetworkImage(
                                    authController.myUser.value.image!),
                                fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hey, Nice to meet you ',
                            style: GoogleFonts.poppins(
                                color: Colors.black.withOpacity(0.28),
                                fontSize: 14)),

                        // Text(
                        //   'Mark Novak',
                        //   style: GoogleFonts.poppins(
                        //       color: Colors.black.withOpacity(0.28),
                        //       fontSize: 14),
                        // )
                        Text(
                          authController.myUser.value.name == null
                              ? "Mark"
                              : authController.myUser.value.name!,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
                    ),
                  )
                ],
              )),
            
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                buildDrawerItem(
                    title: 'History', onPressed: () {}, isVisible: true),
                // buildDrawerItem(title: 'Do', onPressed: () {}),
                // buildDrawerItem(title: 'Promo Codes', onPressed: () {}),
                buildDrawerItem(title: 'Settings', onPressed: () {}),
                // buildDrawerItem(title: 'Support', onPressed: () {}),
                buildDrawerItem(
                    title: 'Log Out',
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    }),
              ],
            ),
          ),
          const Spacer(),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                buildDrawerItem(
                    title: 'Do more',
                    onPressed: () {},
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.15),
                    height: 20),
                const SizedBox(
                  height: 20,
                ),
                buildDrawerItem(
                    title: 'privacy policy',
                    onPressed: () {},
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.15),
                    height: 20),
                buildDrawerItem(
                  title: 'Rate us on store',
                  onPressed: () {},
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.15),
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  buildDrawerItem(
      {required String title,
      required Function onPressed,
      Color color = Colors.black,
      double fontSize = 20,
      FontWeight fontWeight = FontWeight.w700,
      double height = 45,
      bool isVisible = false}) {
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        // minVerticalPadding: 0,
        dense: true,
        onTap: () => onPressed(),
        title: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: fontSize, fontWeight: fontWeight, color: color),
            ),
            const SizedBox(
              width: 5,
            ),
            isVisible
                ? CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    radius: 15,
                    child: Text(
                      '1',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
