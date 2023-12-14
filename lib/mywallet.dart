// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix_uts/topupmenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myWallet extends StatefulWidget {
  const myWallet({Key? key}) : super(key: key);

  @override
  State<myWallet> createState() => _myWalletState();
}

class _myWalletState extends State<myWallet> {
  String id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(id).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 111, 11, 225),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          int saldo = snapshot.data?.get('saldo') ?? 0;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10.0),
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
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "My Wallet",
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Center(
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: 300,
                          height: 190,
                          child: Image.asset(
                            "assets/wallet.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: 115,
                          left: 20,
                          child: Text(
                            "IDR $saldo",
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 140,
                          left: 20,
                          bottom: 20,
                          child: Text(
                            "Current Available",
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Recent Transaction",
                  style: GoogleFonts.raleway(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "Harusnya disini History TopUp User",
                    style: GoogleFonts.raleway(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => topupmenu()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 111, 11, 225),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                    child: Text(
                      "Top Up Wallet",
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}