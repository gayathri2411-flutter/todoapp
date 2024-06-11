import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FavoriteView extends GetView {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoriteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoriteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
