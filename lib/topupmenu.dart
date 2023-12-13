// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix_uts/succestopup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class topupmenu extends StatefulWidget {
  const topupmenu({Key? key}) : super(key: key);

  @override
  State<topupmenu> createState() => _topupmenuState();
}

// Membuat objek Timestamp
Timestamp timestamp = Timestamp.now();

// Mengonversi Timestamp menjadi DateTime
DateTime dateTime = timestamp.toDate();

// Memformat DateTime menjadi string sesuai kebutuhan
String formattedDate = DateFormat('MMMM d, y h:mm:ss a').format(dateTime);

// class topupmenu{
//   int harga;

//   topupmenu(this.harga);
// }

// List<topupmenu> TopUp =[

// ]

class _topupmenuState extends State<topupmenu> {
  TextEditingController _controller = TextEditingController();
  int currentBalance = 0;
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    List<String> template = [
      "50.000",
      "100.000",
      "150.000",
      "200.000",
      "500.000",
      "1.000.000"
    ];
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
            "Top Up",
            style: GoogleFonts.raleway(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "IDR",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 208, 165, 203),
                              width: 1,
                            )),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            labelStyle: GoogleFonts.raleway(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        "Choose by template",
                        style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 350, // Adjust the height based on your needs
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: template.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              _controller.text = template[index];
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: _controller.text == template[index]
                                    ? Colors.black
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "IDR",
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    template[index],
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () async {
                          int templateValue = int.tryParse(
                                  _controller.text.replaceAll(".", "")) ??
                              0;
                          int newTopUpAmount = templateValue;

                          CollectionReference usersCollection =
                              FirebaseFirestore.instance.collection('users');

                          String id = FirebaseAuth.instance.currentUser!.uid;

                          DocumentSnapshot userSnapshot =
                              await usersCollection.doc(id).get();
                          int currentBalance = userSnapshot.get('saldo');

                          int updatedBalance = currentBalance + newTopUpAmount;

                          await usersCollection
                              .doc(id)
                              .update({'saldo': updatedBalance});

                          setState(() {
                            currentBalance = updatedBalance;

                            CollectionReference historiTopupCollection =
                                FirebaseFirestore.instance
                                    .collection('historyTopup');
                            Map<String, dynamic> checkoutTopup = {
                              'idCust': id,
                              'waktu': formattedDate,
                              'saldoTopUp': templateValue,
                            };
                            historiTopupCollection.add(checkoutTopup);
                          });

                          print("New Balance: $currentBalance");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => succestopup(),
                            ),
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
                          "Top Up My Wallet",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
