import 'package:flutix_uts/moviedetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NAMA USER DISINI",
                      style: GoogleFonts.raleway(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "SALDO USER DISINI",
                      style: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Now Playing",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => moviedetails()));
                },
                child: Container(
                  height: 120.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        margin: EdgeInsets.only(top: 8.0, right: 15.0),
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Movie Category",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 70.0,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 65,
                        margin:
                            EdgeInsets.only(left: 15.0, top: 8.0, right: 3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Coming Soon",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 180.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 8.0, right: 15.0),
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ]),
          ),
          Center(
            child: Container(width: 280, height: 90, color: Colors.grey),
          )
        ]),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_rounded),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount_rounded),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
