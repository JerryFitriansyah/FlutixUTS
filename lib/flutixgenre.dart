import 'package:flutix_uts/flutixconfirm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class flutixgenre extends StatefulWidget {
  flutixgenre({super.key});

  @override
  State<flutixgenre> createState() => _flutixgenreState();
}

class _flutixgenreState extends State<flutixgenre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 111, 11, 225),
              size: 32,
            ),
          ),
        ),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Select Your",
                style: GoogleFonts.raleway(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    "Genre",
                    style: GoogleFonts.raleway(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Horror",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Music",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Action",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Drama",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Adventure",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Crime",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                "Which Movie Language",
                style: GoogleFonts.raleway(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "You Prefer",
                style: GoogleFonts.raleway(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Indonesia",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "English",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Korean",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Japanese",
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 40),
                  child: Text(
                    "Continue to Sign Up",
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => flutixconfirm()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 70, right: 20, top: 40, bottom: 40),
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Color.fromARGB(255, 111, 11, 225),
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
