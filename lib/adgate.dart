import 'package:flutter/material.dart';

class Adgate extends StatefulWidget {
  const Adgate({Key? key}) : super(key: key);

  @override
  State<Adgate> createState() => _AdgateState();
}

class _AdgateState extends State<Adgate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AdgateMedia"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Working...",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We are hardly  work for complete our development process. please be patient ",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      )),
    );
  }
}
