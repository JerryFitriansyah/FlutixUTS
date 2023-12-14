// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/models.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  //Profile? user;
  String username = '';
  String email = '';
  String profilePictureUrl = '';
  String oldPass = "";
  String newPass = "";

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
      oldPass = prefs.getString('password') ?? "";
      newPass = prefs.getString(_controllerNewPass.text) ?? "";

      profilePictureUrl = prefs.getString('profilePictureUrl') ?? "";
    });
  }

  Future<String> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profilePictureUrl') ?? "";
  }

  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerOldPass = TextEditingController();
  final TextEditingController _controllerNewPass = TextEditingController();

  handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final nama = _controllerNama.value.text;
      final email = _controllerEmail.value.text;
      final password = _controllerNewPass.value.text;

      setState(() => _loading = true);

    }
  }

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
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "Edit Profile",
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    FutureBuilder<String>(
                      future:
                          _loadProfileImage(), // Panggil fungsi di dalam HomePage
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(
                            color: Color.fromARGB(255, 247, 234, 60),
                          );
                        } else if (snapshot.hasData) {
                          final profilePictureUrl = snapshot.data!;
                          return Icon(
                            Icons.person_2_rounded,
                            size: 100,
                          );
                        } else {
                          return Icon(
                            Icons.person_2_rounded,
                            size: 100,
                          );
                        }
                      },
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: TextFormField(
                          controller: _controllerNama,
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            labelText: "Full Name",
                            labelStyle:
                                GoogleFonts.raleway(color: Colors.black),
                            hintText: username ?? "Loading...",
                            hintStyle: GoogleFonts.raleway(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 234, 60),
                                width: 3,
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: TextFormField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                            enabled: false,
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                            hintText: email ?? "Loading...",
                            hintStyle: GoogleFonts.raleway(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 247, 234, 60),
                                width: 3,
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: TextFormField(
                        controller: _controllerOldPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabled: false,
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: "********",
                          hintStyle: GoogleFonts.raleway(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 234, 60),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: ElevatedButton(
                        onPressed: () async {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            CollectionReference users =
                                firestore.collection('users');
                            User? user = FirebaseAuth.instance.currentUser;

                            //handleSubmit();
                            String id = FirebaseAuth.instance.currentUser!.uid;
                            await users.doc(id).update({
                              "nama": _controllerNama.text.isEmpty
                                  ? user!.displayName ?? ""
                                  : _controllerNama.text.toString(),
                            });

                            Navigator.of(context).pop();
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
                          "Update Now",
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
