


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
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
                    child: Text("Change text")),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar("dream", "dream comes true when you work hard");
                  },
                  child: Text("Showsnackbar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "dream comes true when you work hard");
                  },
                  child: Text("Diologbox"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
