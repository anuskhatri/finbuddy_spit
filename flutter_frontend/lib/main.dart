import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/pages/login/spit_login.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spit Hackathon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(bgColor.value)),
        useMaterial3: true,
      ),
      home: SpitLogin(),
    );
  }
}
