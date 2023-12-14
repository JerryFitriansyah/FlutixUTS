import 'package:flutix_uts/models/models.dart';
import 'package:flutix_uts/myticket.dart';
import 'package:flutix_uts/profile.dart';
import 'package:flutix_uts/services/services.dart';
import 'package:flutix_uts/widgets/moviecomingposter.dart';
import 'package:flutix_uts/widgets/movieposter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _currentIndex = 0;
  String username = '';
  String profilePictureUrl = '';
  int? saldo;
  List<Movie> movies = [];

  List<Movie> comingSoonMovies = [];

  @override
  void initState() {
    super.initState();
    loadProfile();
    updateProfile();
  }

  Future<void> loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('nama') ?? "";
      profilePictureUrl = prefs.getString('profilePictureUrl') ?? "";
      saldo = prefs.getInt('saldo');
    });
  }

  Future<void> updateProfile() async {
    await loadProfile();
  }

  Future<String> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profilePictureUrl') ?? "";
  }

  Widget build(BuildContext context) {
    Future<List<Movie>> nowPlaying = Api.getMovies('now_playing', 4);
    Future<List<Movie>> comingSoon = Api.getMovies('upcoming', 4);
    return Scaffold(
      body: ListView(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_4_rounded,
                  size: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username ?? "Loading...",
                      style: GoogleFonts.raleway(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "IDR $saldo",
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
              SizedBox(height: 10,),
              FutureBuilder<List<Movie>>(
                  future: nowPlaying,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: Color.fromARGB(255, 247, 234, 60),
                      );
                    } else if (snapshot.hasData) {
                      final movies = snapshot.data!;
                      return Container(
                        height: 156,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            return MoviePoster(
                              //nama widget
                              movie: movies[i],
                              saldo: saldo!, //movies[i].nama dls
                            );
                            // .noRate();
                          },
                          itemCount: movies.length,
                        ),
                      );
                    } else {
                      return const Text("there is no data");
                    }
                  }),
              SizedBox(height: 10),
              Text(
                "Movie Category",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/action.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Action",
                        style: GoogleFonts.raleway(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/battle.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Battle",
                        style: GoogleFonts.raleway(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/scifi.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Sci-Fi",
                        style: GoogleFonts.raleway(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/kids.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Kids",
                        style: GoogleFonts.raleway(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Coming Soon",
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                future: comingSoon,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Color.fromARGB(255, 247, 234, 60),
                    );
                  } else if (snapshot.hasData) {
                    final movies = snapshot.data!;
                    return Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) {
                          return MovieComingPoster(
                            movie: movies[i],
                            saldo: saldo!,
                          );
                        },
                        itemCount: movies.length,
                      ),
                    );
                  } else {
                    return const Text("There is no data");
                  }
                },
              ),
              SizedBox(height: 20),
            ]),
          ),
          Center(
            child: Container(
              width: 280,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/promo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ]),
      ]),
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
        selectedLabelStyle: TextStyle(
          color: Color.fromARGB(255, 111, 11, 225),
        ),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 111, 11, 225)),
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
