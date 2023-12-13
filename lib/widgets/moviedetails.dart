// ignore_for_file: must_be_immutable

import 'package:flutix_uts/selectplace.dart';
import 'package:flutix_uts/widgets/moviecast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutix_uts/models/models.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  int? saldo;
  Color textColor = const Color(0xFFF4EDE6);

  MovieDetails({Key? key, required this.movie, required this.saldo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rating = movie.rate / 2;
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) > 0;

    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  movie.poster,
                ),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color.fromARGB(255, 111, 11, 225),
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              movie.judul,
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: List.generate(
                  fullStars,
                  (starIndex) {
                    return const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 247, 234, 60),
                      size: 16,
                    );
                  },
                ),
              ),
              if (hasHalfStar)
                const Icon(
                  Icons.star_half,
                  color: Color.fromARGB(255, 247, 234, 60),
                  size: 16,
                ),
              const SizedBox(width: 5),
              Text(
                "${movie.rate.toStringAsFixed(1)}/10",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                  movie.genre.join(", "),
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                ),
                const SizedBox(height: 20),
                Text(
                  "StoryLine",
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _truncateText(movie.storyLine, 500),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Cast",
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: movie.listCast!.map((cast) {
                  return movieCast(cast: cast);
                }).toList(),
              ),
            ),
          ),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 40),
            child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return selectplace(
                              saldo: saldo,
                              movie: movie,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 111, 11, 225),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: Text(
                      "Continue to Book",
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

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength)}...';
  }
}
