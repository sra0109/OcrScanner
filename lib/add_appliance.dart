import 'package:flutter/material.dart';

class AddAppliance extends StatelessWidget {
  const AddAppliance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(Icons.clear),
          )
        ],
        title: const Center(
          child: Text(
            'ADD APPLIANCE',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: const [
          Image(image: AssetImage('assets/add1.jpg')),
        ],
      ),
    );
  }
}
