import 'package:flutter/material.dart';

class NoInterNetWidget extends StatelessWidget {
  const NoInterNetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Text(
          "Please Check Your Connection!",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
        ));
  }
}
