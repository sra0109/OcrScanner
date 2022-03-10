import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  List resultStrings = [];
  String result = '';
  String scan = 'Hi';
  bool isInitialized = false;
  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((x) => setState(() {}));
  }

  _startScan() async {
    List<OcrText> list = [];

    try {
      list = await FlutterMobileVision.read(
        waitTap: true,
        showText: false,
        fps: 2.0,
        multiple: true,
      );

      for (OcrText text in list) {
        resultStrings.add(text.value);
      }
      // for (String i in resultStrings) {
      //   result = result + ', ' + i;
      // }
      List finalResult = [];
      for (String str in resultStrings) {
        str = str.toUpperCase();
        finalResult.add(str);
      }
      Navigator.pushReplacementNamed(context, 'data', arguments: finalResult);
      // setState(() {
      //   scan = result;
      // });
    } catch (e) {
      setState(() {
        scan = 'Error while scanning';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press scan button to start the scan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _startScan, child: const Text('SCAN'))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
