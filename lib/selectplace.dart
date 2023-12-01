import 'package:flutix_uts/selectseat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class selectplace extends StatefulWidget {
  selectplace({super.key});

  @override
  State<selectplace> createState() => _selectplaceState();
}

class _selectplaceState extends State<selectplace> {
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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                "Choose Date",
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
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    width: 65,
                    margin: EdgeInsets.only(left: 15.0, top: 10.0, right: 3.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                "Where To Watch?",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 20.0),
              child: Text(
                "Plaza Mulia CGV",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 30.0,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 65,
                    margin: EdgeInsets.only(left: 15.0, top: 5.0, right: 3.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 20.0),
              child: Text(
                "Big Mall XXI",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 30.0,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 65,
                    margin: EdgeInsets.only(left: 15.0, top: 5.0, right: 3.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 20.0),
              child: Text(
                "SCP",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 30.0,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 65,
                    margin: EdgeInsets.only(left: 15.0, top: 5.0, right: 3.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, bottom: 40),
                child: Text(
                  "Select Your Seat",
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
                      MaterialPageRoute(builder: (context) => selectseat()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 130, top: 40, bottom: 40, right: 10),
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Color.fromARGB(255, 111, 11, 225),
                    size: 40,
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
