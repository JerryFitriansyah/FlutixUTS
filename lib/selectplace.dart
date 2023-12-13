import 'package:flutix_uts/selectseat.dart';
import 'package:flutix_uts/models/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class selectplace extends StatefulWidget {
  Movie movie;
  int? saldo;
  selectplace({super.key, required this.movie, required this.saldo});

  @override
  State<selectplace> createState() => _selectplaceState();
}

class _selectplaceState extends State<selectplace> {
  List<String> bioskop = [
    'Plaza Mulia CGV',
    'Samarinda Square XXI',
    'Big Mall XXI'
  ];

  List<String> jam = [
    '11.30',
    '14.45',
    '17.00',
    '19.30',
    '22:00',
  ];

  int pilihTanggal = -1;
  Map<String, int> pilihJamMap = {};
  String pilihBioskop = "";
  String pilihJam = "";
  String pilihHari = "";

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
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.movie.poster,
                  ),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
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
                    DateTime currentDate =
                        DateTime.now().add(Duration(days: index));
                    String namaHari = DateFormat('EEE').format(currentDate);
                    String tanggal = DateFormat('d').format(currentDate);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          pilihTanggal = index;
                          pilihHari = "$namaHari , $tanggal";
                        });
                      },
                      child: Container(
                        width: 65,
                        margin:
                            EdgeInsets.only(left: 15.0, top: 10.0, right: 3.0),
                        decoration: BoxDecoration(
                          color: pilihTanggal == index
                              ? Color.fromARGB(255, 247, 234, 60)
                              : Colors.grey,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$namaHari',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  color: pilihTanggal == index
                                      ? Colors.black
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              '$tanggal',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  color: pilihTanggal == index
                                      ? Colors.black
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
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
            Column(
              children: List.generate(bioskop.length, (index) {
                String namaBioskop = bioskop[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                      child: Text(
                        namaBioskop,
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(jam.length, (i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                pilihJamMap[namaBioskop] = i;
                                pilihBioskop = namaBioskop;
                                pilihJam = jam[i];
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 25,
                              margin: EdgeInsets.only(
                                left: 20.0,
                                top: 5.0,
                                bottom: 15.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color.fromARGB(255, 247, 234, 60)),
                                color: pilihJamMap[namaBioskop] == i
                                    ? Color.fromARGB(255, 247, 234, 60)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  jam[i],
                                  style: GoogleFonts.openSans(
                                    color: pilihJamMap[namaBioskop] == i
                                        ? Colors.black
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              }),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => selectseat(
                              movie: widget.movie,
                              namaBioskop: pilihBioskop,
                                  namaJam: pilihJam,
                                  namaHari: pilihHari,
                                  saldo: widget.saldo!,
                            )));
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
      ]),
    );
  }
}
