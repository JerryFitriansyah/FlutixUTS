import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix_uts/homepage.dart';
import 'package:flutix_uts/profile.dart';
import 'package:flutix_uts/ticketdetail.dart';
import 'package:flutix_uts/widgets/historyticket.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/models.dart';

class myticket extends StatefulWidget {
  const myticket({super.key});

  @override
  State<myticket> createState() => _myticketState();
}

class _myticketState extends State<myticket> {
  Movie? movies;
  int _currentIndex = 1;

  Color buttonColorNew = Colors.transparent;
  Color buttonColorUsed = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "My Tickets",
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 90,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonColorNew = Color.fromARGB(255, 111, 11, 225);
                            buttonColorUsed = Colors.transparent;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColorNew,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size(130, 40),
                        ),
                        child: Text(
                          "New",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonColorUsed = Color.fromARGB(255, 111, 11, 225);
                            buttonColorNew = Colors.transparent;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColorUsed,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size(130, 40),
                        ),
                        child: Text(
                          "Used",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => detailTicket(),
                      ),
                    );
                  },
                  child: Container(
                    height: 500,
                    child: buttonColorNew == Color.fromARGB(255, 111, 11, 225)
                        ? buildHistoryList(true)
                        : buildHistoryList(false),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return homepage();
                      },
                    ),
                  );
                },
                child: Icon(Icons.play_circle_fill_rounded),
              ),
            ),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return myticket();
                      },
                    ),
                  );
                },
                child: Icon(Icons.discount_rounded),
              ),
            ),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfilPage();
                      },
                    ),
                  );
                },
                child: Icon(Icons.person),
              ),
            ),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: TextStyle(color: Color.fromARGB(255, 111, 11, 225),),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedIconTheme: IconThemeData(color:  Color.fromARGB(255, 111, 11, 225)),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}