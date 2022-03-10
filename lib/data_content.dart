import 'package:flutter/material.dart';
import 'home_page.dart';

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
    void scanAgain() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                const MyHomePage(title: 'OCR_SCANNER'),
          ));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Data Content Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Network',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: networkController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'MAC',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: macController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(height: 20),
            Text(error),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: scanAgain, child: const Text('Scan'))
          ],
        ),
      ),
    );
  }
}
