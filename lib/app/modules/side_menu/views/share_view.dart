import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ShareView extends GetView {
  const ShareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShareView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShareView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
