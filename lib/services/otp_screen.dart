import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class Page2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(
      body: Form(
        key: controller.formKeyOtp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'One Time password',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Center(
              child: Obx(() => Text(
                  "Please enter the OTP sent to ${controller.controllerText.value}")),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: TextFormField(
                  validator: (value) => controller.otpValidator(value!),
                  controller: controller.otpController,
                  decoration: InputDecoration(hintText: 'Otp')),
            ),
            SizedBox(height: 30),
            Obx(
              () => Text(controller.count.value.toString()),
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.formKeyOtp.currentState!.validate()) {
                    controller.count.value++;
                    controller.verifyOTP();

                    print("pressed");
                  }
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}


