import 'package:app_employe/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:app_employe/Splash_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
      home: SplashScreen(),
      defaultTransition: Transition.leftToRight,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false));
}
