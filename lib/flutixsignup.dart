// ignore_for_file: camel_case_types, prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutix_uts/auth/auth.dart';
import 'package:flutix_uts/flutixgenre.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class flutixsignup extends StatefulWidget {
  flutixsignup({super.key});

  @override
  State<flutixsignup> createState() => _flutixsignupState();
}

class _flutixsignupState extends State<flutixsignup> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  final TextEditingController _ctrlNama = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlConfirmPassword = TextEditingController();

  handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final nama = _ctrlNama.value.text;
      final email = _ctrlEmail.value.text;
      final password = _ctrlPassword.value.text;

      setState(() => _loading = true);

      try {
        // // Registrasi pengguna
        await Auth().regis(email, password, nama, 200000);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => flutixgenre()),
        );
      } catch (error) {
        // Tangani kesalahan yang mungkin terjadi saat registrasi
        print('Error during registration: $error');

        // Tampilkan pesan kesalahan ke pengguna, misalnya, dengan menggunakan snackbar.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
          ),
        );
      } finally {
        setState(() => _loading = false);
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
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Create Your",
                    style: GoogleFonts.raleway(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Account",
                    style: GoogleFonts.raleway(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.person_4_rounded,
                        color: Color.fromARGB(255, 247, 234, 60),
                        size: 100,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 70.0, right: 20),
                        child: Icon(
                          Icons.add_circle,
                          color: Color.fromARGB(255, 111, 11, 225),
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFormField(
                    controller: _ctrlNama,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insert your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: "Full Name",
                      labelStyle: GoogleFonts.raleway(color: Colors.black),
                      hintText: "Your Full Name...",
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
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: TextFormField(
                    controller: _ctrlEmail,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insert your email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: "Email Address",
                      labelStyle: GoogleFonts.raleway(color: Colors.black),
                      hintText: "Your Email Address...",
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
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: TextFormField(
                    controller: _ctrlPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insert your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: "Password",
                      labelStyle: GoogleFonts.raleway(color: Colors.black),
                      hintText: "***********",
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
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: TextFormField(
                    controller: _ctrlConfirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Insert your confirm password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      labelText: "Confirm Password",
                      labelStyle: GoogleFonts.raleway(color: Colors.black),
                      hintText: "***********",
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
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, bottom: 40),
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
                      onTap: () async {
                        handleSubmit();
                        CollectionReference users =
                            FirebaseFirestore.instance
                                .collection('users');
                        Map<String, dynamic> dataUsers = {
                          'email': _ctrlEmail.text.toString(),
                          'nama': _ctrlNama.text,
                        };
                        users.add(dataUsers);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => flutixgenre()));
                      },
                      child: _loading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 111, 11, 225),
                                strokeWidth: 2,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 70, top: 40, bottom: 40, right: 20),
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
          ),
        ],
      ),
    );
  }
}
