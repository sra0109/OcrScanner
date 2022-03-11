import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ocr_scanner/add_appliance.dart';
import 'package:ocr_scanner/get_started.dart';

import 'add_appliance.dart';

class DataContent extends StatefulWidget {
  const DataContent({Key? key}) : super(key: key);

  @override
  State<DataContent> createState() => _DataContentState();
}

class _DataContentState extends State<DataContent> {
  var networkController = TextEditingController();
  var passwordController = TextEditingController();
  var macController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String error = '';
    List data = [];
    data = ModalRoute.of(context)!.settings.arguments as List;
    Map mapData = {};

    for (String str in data) {
      try {
        List temp = str.split(':');
        String key = temp[0].toString().trim();
        String value = temp[1].toString().trim();
        mapData[key] = value;
      } catch (e) {
        mapData[0] = '';
      }
    }
    try {
      networkController.text = mapData['NETWORK'];
      passwordController.text = mapData['PASSWORD'];
      macController.text = mapData['MAC'];
    } catch (e) {
      error = "Error while scanning please scan again";
    }
    // void scanAgain() {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (BuildContext context) =>
    //             const MyHomePage(title: 'OCR_SCANNER'),
    //       ));
    // }
    void addPage() {
      Timer(const Duration(seconds: 20), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const GetStarted(),
            ));
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const AddAppliance(),
          ));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
            child: Text('SmartHQ',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Network',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                controller: networkController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                controller: passwordController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'MAC',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                controller: macController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20),
            Text(error),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addPage,
              child: const Text(
                'CONFIRM',
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  primary: Colors.pink.shade900),
            )
          ],
        ),
      ),
    );
  }
}
