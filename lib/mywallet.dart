import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 363,
          height: 826,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 42,
                top: 123,
                child: Container(
                  width: 280,
                  height: 166,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0E41F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 305,
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 117,
                top: 354,
                child: Text(
                  'Curse Of Chucky',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 647,
                child: Text(
                  'Barbie',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 499,
                child: Text(
                  'Top Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 393,
                child: Text(
                  'Senin 24, 14.00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 686,
                child: SizedBox(
                  width: 162,
                  height: 23,
                  child: Text(
                    'Kamis 27, 17.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 117,
                top: 534,
                child: Text(
                  'Rabu 26, 13.00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 428,
                child: Text(
                  'XXI Bigmall Samarinda',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 725,
                child: Text(
                  'XXI Bigmall Samarinda',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 118,
                top: 570,
                child: Text(
                  'IDR.500.000.000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 253,
                child: Text(
                  'Current Available',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 133,
                child: Text(
                  'VISA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 222,
                child: Text(
                  'IDR 250.000.000.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w700,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Positioned(
                left: 132,
                top: 30,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 27,
                child: Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 2.50, vertical: 4.38),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 319,
                top: 1739,
                child: Container(
                  width: 548,
                  height: 123,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 30,
                top: 353,
                child: Container(
                  width: 76,
                  height: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/76x110"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 495,
                child: Container(
                  width: 76,
                  height: 110,
                  decoration: BoxDecoration(color: Color(0xFF0E41F6)),
                ),
              ),
              Positioned(
                left: 49,
                top: 543,
                child: Text(
                  'DANA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 647,
                child: Container(
                  width: 74.73,
                  height: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/75x110"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 782,
                child: Container(
                  width: 205,
                  height: 37,
                  decoration: ShapeDecoration(
                    color: Color(0xFF6750A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 139,
                top: 791,
                child: Text(
                  'Top Up Wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 363,
                  height: 22.90,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.30,
                          child: Container(
                            width: 363,
                            height: 22.90,
                            decoration: BoxDecoration(color: Color(0xFFAA9D9D)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 298.27,
                        top: 6.15,
                        child: SizedBox(
                          width: 39.84,
                          height: 11.41,
                          child: Text(
                            '16:20',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}