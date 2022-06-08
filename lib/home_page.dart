import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxcode/services/login_screen.dart';
import 'package:getxcode/services/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _selectedLang = LocalizationService.langs.first;
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState

    box.write('darkmode', "Karan");
  }

  String name = "name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(Page1());
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('hello'.tr),
                ElevatedButton(
                    onPressed: () {
                      LocalizationService().changeLocale("English");
                    },
                    child: const Text("English")),
                ElevatedButton(
                    onPressed: () {
                      LocalizationService().changeLocale("日本語");
                    },
                    child: const Text("Japani")),
                Text(name),
                ElevatedButton(
                    onPressed: () {
                      name = box.read('darkmode');
                      setState(() {});
                    },
                    child: const Text("Change text")),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar("dream", "dream comes true when you work hard");
                  },
                  child: const Text("Showsnackbar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(title: "dream comes true when you work hard");
                  },
                  child: const Text("Diologbox"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
