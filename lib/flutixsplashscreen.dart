// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutix_uts/flutixsignin.dart';
import 'package:flutix_uts/flutixsignup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class flutixsplashscreen extends StatefulWidget {
  flutixsplashscreen({super.key});

  @override
  State<flutixsplashscreen> createState() => _flutixsplashscreenState();
}

class _flutixsplashscreenState extends State<flutixsplashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130.0, bottom: 20),
            child: Container(
              width: 290,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/flutixlogo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "New Experience",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Watch a new movie much easier",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "easier than any before",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => flutixsignin(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 111, 11, 225),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              minimumSize: Size(250, 50),
            ),
            child: Text(
              "Get Started",
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wanna Make Account?",
                style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => flutixsignup()));
                },
                child: Text(
                  "  Sign Up",
                  style: TextStyle(
                    color: Color.fromARGB(255, 111, 11, 225),
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}