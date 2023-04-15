import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_app/network_fetch_screen.dart';
import 'package:simple_app/second_screen.dart';
import 'package:simple_app/sign_up_screen.dart';
import 'package:simple_app/state_managed_screen.dart';
import 'package:simple_app/utils/StorageUtil.dart';
import 'package:simple_app/utils/initial_binding.dart';

import 'login_screen.dart';

void main() {
  InitialBinding().dependencies() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(title: "title"),
    );
  }
}