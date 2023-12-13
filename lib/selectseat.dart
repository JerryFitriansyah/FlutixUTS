import 'package:flutix_uts/checkoutScreen1.dart';
import 'package:flutix_uts/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class selectseat extends StatefulWidget {
  
  Movie movie;
  int saldo;

  selectseat({Key? key, required this.movie, required this.namaJam, required this.saldo, required this.namaHari, required this.namaBioskop}) : super(key: key);
  
  String namaBioskop;
  String namaJam;
  String namaHari;
  

  @override
  State<selectseat> createState() => _selectseatState();
}

Color kSeatBookedColor = Color.fromARGB(255, 111, 11, 225);
Color kSeatSelectedColor = Color.fromARGB(255, 247, 234, 60);

class _selectseatState extends State<selectseat> {
  List<List<bool>> seatStatus =
      List.generate(8, (index) => List.filled(6, false));
  List<String> selectedSeats = [];

  Widget buildSeatContainer(String seatText, int row, int col) {
    return InkWell(
      onTap: () {
        setState(() {
          seatStatus[row][col] = !seatStatus[row][col];
        });
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: seatStatus[row][col] ? kSeatSelectedColor : Colors.white,
          border: Border.all(color: Color.fromARGB(255, 247, 234, 60), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(seatText),
        ),
      ),
    );
  }

    List<Widget> buildSeatRow(String rowName, int row) {
    List<Widget> rowWidgets = List.generate(6, (col) {
      final seatText = "$rowName${6 - col}";
      return buildSeatContainer(seatText, row, col);
    });
    return rowWidgets;
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
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              8,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildSeatRow(
                  String.fromCharCode('H'.codeUnitAt(0) - index),
                  index,
                ),
              ),
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
                      color: Color.fromARGB(255, 111, 11, 225),
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
                      color: Color.fromARGB(255, 247, 234, 60),
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
                  selectedSeats.clear(); // Clear existing selections
                      for (int i = 0; i < seatStatus.length; i++) {
                        for (int j = 0; j < seatStatus[i].length; j++) {
                          if (seatStatus[i][j]) {
                            selectedSeats.add(
                                String.fromCharCode('H'.codeUnitAt(0) - i) +
                                    (6 - j).toString());
                          }
                        }
                      }
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => checkoutScreen1(namaBioskop: widget.namaBioskop,
                                  namaJam: widget.namaJam,
                                  namaHari: widget.namaHari,
                                  selectedSeats: selectedSeats,
                                  saldo: widget.saldo,
                                  movies: widget.movie,)));
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
