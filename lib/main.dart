import 'package:flutter/material.dart';
import 'package:flutter_application_2/Camo/UIs/Scan/camara_screen.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Camara_Screen(),
    );
  }
}

