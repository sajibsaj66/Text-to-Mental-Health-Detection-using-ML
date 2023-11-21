import 'package:fl_country_code_picker/fl_country_code_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental/views/otp_verification.dart';
import '../widgets/green_intro_widget.dart';
import '../widgets/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryPicker = const FlCountryCodePicker();

  CountryCode countryCode =
      const CountryCode(name: "Bangladesh", code: "BD", dialCode: '+880');

  onSubmit(String? input) {
    Get.to(() => OtoVerificationScreen(countryCode.dialCode+input!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greenIntroWidget(),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: loginWidget(countryCode, () async {
                  final code = await countryPicker.showPicker(context: context);
                  if (code != null) countryCode = code;

                  setState(() {});
                }, onSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
