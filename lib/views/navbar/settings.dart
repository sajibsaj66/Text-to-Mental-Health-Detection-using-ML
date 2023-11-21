// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class settings extends StatelessWidget {
//   const settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }



// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mental/controller/auth_controller.dart';
import 'package:mental/utils/app_colors.dart';
import 'package:mental/views/home_screen.dart';
import 'package:path/path.dart' as Path;

import '../../widgets/green_intro_widget.dart';


class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<settings> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  // late LatLng homeAddress;
  // late LatLng businessAddress;
  // late LatLng shoppingAddress;

  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                        onTap: (() {
                          getImage(ImageSource.camera);
                        }),
                        child: selectedImage == null
                            ? Container(
                                width: 120,
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD6D6D6)),
                                child: Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(
                                width: 120,
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(selectedImage!),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Color(0xffD6D6D6)),
                              )),
                    // : Container(
                    //     width: 120,
                    //     height: 120,
                    //     margin: EdgeInsets.only(bottom: 20),
                    //     decoration: BoxDecoration(
                    //         image: DecorationImage(
                    //             image: FileImage(selectedImage!),
                    //             fit: BoxFit.fill),
                    //         shape: BoxShape.circle,
                    //         color: Color(0xffD6D6D6)),
                    //   ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                onWillPop: null,
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                        'Name', Icons.person_outlined, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Name is empty';
                      }
                      if (input.length < 5) {
                        return 'Please enter a valid name';
                      }
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Home Address', Icons.home_outlined, homeController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Home Address is empty';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Contact', Icons.contact_phone, contactController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Home Address is empty';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Occupation', Icons.work, occupationController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Home Address is empty';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx((() => authController.isProfileUploading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : greenButton('submit', () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            // if (selectedImage == null) {
                            //   Get.snackbar("Wraning", 'Please add your image');
                            //   return;
                            // }
                            authController.isProfileUploading(true);

                            authController.storeUserInfo(
                                selectedImage!,
                                nameController.text,
                                homeController.text,
                                contactController.text,
                                occupationController.text);
                           
                          })))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFieldWidget(String title, IconData iconData,
      TextEditingController controller, Function Validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            validator: (String? input) {
              return Validator(input);
              //  return validator(input);
            },
            // validator: (input) => validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7)),
            // readOnly: readOnly,
            // onTap: ()=> onTap!(),
            // validator: (input)=> validator(input),
            // controller: controller,
            // style: GoogleFonts.poppins(
            //     fontSize: 14,
            //     fontWeight: FontWeight.w600,
            //     color: Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.greenColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.greenColor,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
