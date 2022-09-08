import 'package:flutter/material.dart';

class Offertoro extends StatefulWidget {
  const Offertoro({Key? key}) : super(key: key);

  @override
  State<Offertoro> createState() => _OffertoroState();
}

class _OffertoroState extends State<Offertoro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offertoro"),
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
