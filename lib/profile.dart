// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix_uts/editprofile.dart';
import 'package:flutix_uts/homepage.dart';
import 'package:flutix_uts/flutixsplashscreen.dart';
import 'package:flutix_uts/myticket.dart';
import 'package:flutix_uts/mywallet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilPage> {
  String username = '';
  String email = '';
  String profilePictureUrl = '';

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('nama') ?? "";
      email = prefs.getString('email') ?? "";
      profilePictureUrl = prefs.getString('profilePictureUrl') ?? "";
    });
  }

  Future<String> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profilePictureUrl') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 2;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    FutureBuilder<String>(
                      future:
                          _loadProfileImage(), // Panggil fungsi di dalam HomePage
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(
                            color: Color(0xFFE1A20B),
                          );
                        } else if (snapshot.hasData) {
                          return Icon(
                            Icons.person_4_outlined,
                            size: 100,
                          );
                        } else {
                          return Icon(
                            Icons.person_4_outlined,
                            size: 100,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      username ?? "Loading...",
                      style: GoogleFonts.raleway(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      email ?? "Loading...",
                      style: GoogleFonts.raleway(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.settings_applications)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()),
                              );
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              "Edit Profile",
                              style: GoogleFonts.raleway(fontSize: 16),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.wallet_rounded)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => myWallet()),
                              );
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              "My Wallet",
                              style: GoogleFonts.raleway(fontSize: 16),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.language_rounded)),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              "Change Language",
                              style: GoogleFonts.raleway(fontSize: 16),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.help_center_outlined)),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              "Help Center",
                              style: GoogleFonts.raleway(fontSize: 16),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.rate_review_sharp)),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              "Rate Flutix App",
                              style: GoogleFonts.raleway(fontSize: 16),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return flutixsplashscreen();
                                  },
                                ),
                              );
                            },
                            icon: Icon(Icons.logout)),
                        TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return flutixsplashscreen();
                                  },
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              "Log out",
                              style: GoogleFonts.raleway(fontSize: 16),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
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
