import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutix_uts/firebase_options.dart';
import 'package:flutix_uts/checkoutScreen1.dart';
import 'package:flutix_uts/editprofile.dart';
import 'package:flutix_uts/flutixsignin.dart';
import 'package:flutix_uts/flutixsignup.dart';
import 'package:flutix_uts/flutixsplashscreen.dart';
import 'package:flutix_uts/homepage.dart';
import 'package:flutix_uts/myticket.dart';
import 'package:flutix_uts/selectseat.dart';
import 'package:flutix_uts/succescheckout.dart';
import 'package:flutix_uts/succestopup.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutix App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: flutixsplashscreen(),
    );
  }
}