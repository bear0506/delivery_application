import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:delivery_service/app/ui/splash/splash_ui.dart';
import 'package:delivery_service/app/binding/splash/splash_binding.dart';

import 'app/routes/pages.dart';

// const SERVER_IP = 'https://zipting.com/api/v1/app';
const SERVER_IP = 'http://13.112.147.236:8000/v1/app';
// ignore: constant_identifier_names

// // AOS
// const SERVER_IP = 'http://10.0.2.2:8000/v1/app';
// // IOS
// const SERVER_IP = 'http://127.0.0.1:8000/v1/app';

Logger logger = Logger();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery Service',
        theme: ThemeData(),
        // home: const MainUi(),
        home: const SplashUi(),
        initialRoute: "/",
        initialBinding: SplashBinding(),
        getPages: Pages.routes,
        builder: (context, child) => MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        ),
      );
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
