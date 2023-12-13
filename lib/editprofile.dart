import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String username = '';
  String email = '';
  String profilePictureUrl = '';
  TextEditingController _oldpasswordTextController = TextEditingController();
  TextEditingController _newpasswordTextController = TextEditingController();
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('nama') ?? '';
      email = prefs.getString('email') ?? '';
      profilePictureUrl = prefs.getString('profilePictureUrl') ?? '';
    });
  }

  Future<void> _passChange() async {
    try {
      var currentUser = _auth.currentUser;
      if (currentUser != null) {
        var cred = EmailAuthProvider.credential(
            email: currentUser.email!,
            password: _oldpasswordTextController.text);
        await currentUser.reauthenticateWithCredential(cred);
        await currentUser.updatePassword(_newpasswordTextController.text);

        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Ubah Kata Sandi Berhasil',
            message: 'Gunakan kata sandi terbaru untuk masuk',
            contentType: ContentType.success,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Pengguna tidak ditemukan',
            message: '',
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } catch (error) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Ubah Kata Sandi Gagal',
          message: ' ',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _oldpasswordTextController.dispose();
    _newpasswordTextController.dispose();
    super.dispose();
  }

  Future<String> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profilePictureUrl') ?? '';
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      try {
        await _passChange();

        if (!_loading) {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          CollectionReference users = firestore.collection('users');
          User? user = FirebaseAuth.instance.currentUser;

          String id = FirebaseAuth.instance.currentUser!.uid;
          await users.doc(id).update({
            'fullName': _controllerNama.text.isEmpty
                ? user!.displayName ?? ''
                : _controllerNama.text.toString(),
          });

          Navigator.of(context).pop();
        }
      } catch (error) {
        // Handle errors
      } finally {
        setState(() {
          _loading = true;
        });
      }
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
            'Edit Profile',
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
                      future: _loadProfileImage(),
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
                            labelText: 'Nama Lengkap',
                            labelStyle:
                                GoogleFonts.raleway(color: Colors.black),
                            hintText: username ?? 'Memuat...',
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
                            hintText: email ?? 'Memuat...',
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
                        controller: _newpasswordTextController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(borderSide: BorderSide()),
                          hintText: '********',
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
                        onPressed: handleSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 111, 11, 225),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size(200, 50),
                        ),
                        child: Text(
                          'Update Profile',
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
