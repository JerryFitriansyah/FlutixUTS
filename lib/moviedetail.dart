import 'package:flutix_uts/selectplace.dart';
import 'package:flutix_uts/selectseat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class moviedetails extends StatefulWidget {
  const moviedetails({Key? key}) : super(key: key);

  @override
  State<moviedetails> createState() => _moviedetailsState();
}

class _moviedetailsState extends State<moviedetails> {
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
      body: Column(
        children: [
          Container(
            width: 450,
            height: 200,
            color: Colors.grey,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "NAMA MOVIE DISINI",
                style: GoogleFonts.raleway(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Text(
              "GENRE MOVIE DISINI",
              style: GoogleFonts.raleway(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  4,
                  (index) => Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 247, 234, 60),
                    size: 15.0,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 247, 234, 60),
                  size: 15.0,
                ),
                Text(
                  " 5/5",
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Storyline",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                "Isi Storyline",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Cast",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 70.0,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    width: 65,
                    margin: EdgeInsets.only(left: 15.0, top: 10.0, right: 3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => selectplace(),
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
              "Continue to Book",
              style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
