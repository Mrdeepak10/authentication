import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKeyLogin,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => (Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Login Counter - ${controller.count.value.toString()}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.mobileController,
                    validator: (value) => controller.mobileValidator(value!),
                    decoration: InputDecoration(
                      label: Text("Enter Mobile number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKeyLogin.currentState!.validate()) {
                      controller.loginWithPhone();
                      controller.count.value++;
                    }
                  },
                  child: Text('Send OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
