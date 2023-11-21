// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental/models/user_model/user_model.dart';

import '../views/home_screen.dart';
import '../views/profile_settings.dart';
import 'package:path/path.dart' as Path;

class AuthController extends GetxController {
  String userUid = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthCheck = false;
  dynamic credentials;

  var isProfileUploading = false.obs;

  phoneAuth(String phone) async {
    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('Completed');
          credentials = credential;
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e) {
          log('Failed');
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          log('Code sent');
          verId = verificationId;
          resendTokenId = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log("Error occured $e");
    }
  }

  verifyOtp(String otpNumber) async {
    log("Called");
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: otpNumber);

    log("LogedIn");

    // await FirebaseAuth.instance.signInWithCredential(credential);

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      decideRoute();
    }).catchError((e) {
      print("Error while sign In $e");
    });
  }

  var isDecided = false;

  decideRoute() {
    // if (isDecided) {
    //   return;
    // }
    // isDecided = true;
    // print("called");

    ///step 1- Check user login?
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      /// step 2- Check whether user profile exists?
      ///isLoginAsDriver == true means navigate it to the driver module
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((value) {
        ///isLoginAsDriver == true means navigate it to driver module

        if (value.exists) {
          Get.to(() => const HomeScreen());
          print("Driver HOme Screen");
        } else {
          log('dont have profile screen');
          Get.to(() => const ProfileSettingScreen());
        }

        // if (value.exists) {
        //   Get.offAll(() => HomeScreen());
        // } else {
        //   Get.offAll(() => ProfileSettingScreen());
        // }
      }).catchError((e) {
        print("Error while decideRoute is $e");
      });
    }
  }

  uploadImage(File image) async {
    String imageUrl = "";
    String fileName = Path.basename(image.path);
    var reference = FirebaseStorage.instance.ref().child('users/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
      (value) {
        imageUrl = value;
        print('Download : $value');
      },
    );
    return imageUrl;
  }

  storeUserInfo(File? selectedImage, String name, String home, String contact,
      String occupation,
      {String url = ''}) async {
    String url_new = url;
    if (selectedImage != null) {
       url_new = await uploadImage(selectedImage);
    }

    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'image': url_new,
      'name': name,
      'home_address': home,
      'contact': contact,
      'occupation': occupation,
    }).then((value) {
      isProfileUploading(false);
      Get.to(() => const HomeScreen());
    });
  }

  var myUser = UserModel().obs;

  getUserInfo() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .listen((event) {
      myUser.value = UserModel.fromJson(event.data()!);
    });
  }
}
