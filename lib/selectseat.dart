import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class selectseat extends StatefulWidget {
  selectseat({super.key});

  @override
  State<selectseat> createState() => _selectseatState();
}

class _selectseatState extends State<selectseat> {
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
      body: ListView(children: [
        Column(
          children: [
            Center(
              child: Container(
                width: 300,
                height: 10,
                color: Color.fromARGB(255, 111, 11, 225),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Layar Bioskop",
                style: GoogleFonts.raleway(
                    fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50.0,
              width: 320.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(left: 50, right: 10, top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color.fromARGB(255, 247, 234, 60),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Booked",
                      style: GoogleFonts.raleway(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Available",
                      style: GoogleFonts.raleway(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 111, 11, 225),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Selected",
                      style: GoogleFonts.raleway(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, bottom: 40),
                child: Text(
                  "Confirm Your Book",
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 100, top: 40, bottom: 40, right: 10),
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
      ]),
    );
  }
}
