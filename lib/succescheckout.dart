// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class succescheckout extends StatefulWidget {
  succescheckout({super.key});

  @override
  State<succescheckout> createState() => _succescheckoutState();
}

class _succescheckoutState extends State<succescheckout> {
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
            "Happy Watching!",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "You have successfully",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "bought the ticket",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => flutixsignin(),
              //   ),
              // );
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
              "My Tickets",
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
              GestureDetector(
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => flutixsignup()));
                },
                child: Text(
                  "Back To Home",
                  style: TextStyle(
                    color: Colors.black,
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