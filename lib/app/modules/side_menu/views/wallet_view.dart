import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WalletView extends GetView {
  const WalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WalletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WalletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
