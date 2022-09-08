import 'package:flutter/material.dart';
import 'package:zpay/pollfish.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Withdraw"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Withdraw will be process within 1 week. Please be patient",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Min Amount : 1 \$",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter faucetpay mail'),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter Amount'),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
