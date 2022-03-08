import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'services/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Controller extends GetxController {
  var count = 0.obs;

  String verificationIdReceived = "";
  final formKeyOtp = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController mobileController = TextEditingController();

  TextEditingController otpController = TextEditingController();
 
  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: mobileController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        //  otpVisibility = true;
        verificationIdReceived = verificationId;
        if (formKeyLogin.currentState!.validate()) {
          Get.to(Page2());
        }
          // setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  String? mobileValidator(String value) {
    if (value.isEmpty || value.length != 13) {
      return "Please enter valid number";
    } else {
      return null;
    }
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdReceived, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in successfully");
      if (formKeyOtp.currentState!.validate()) {
        Get.to(HomePage());
      }
      Fluttertoast.showToast(

          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }

  String? otpValidator(String value) {
    if (value.isEmpty || value.length != 6) {
      return 'Please Enter Otp';
    }
    {
      return null;
    }
  }


  void onSubmit() {
    if (formKeyOtp.currentState!.validate()) {
      Get.to(HomePage());
    }
  }

  RxString controllerText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    mobileController.addListener(() {
      controllerText.value = mobileController.text;
    });
  }
}
