 import 'package:flutter/material.dart';

final lightTheme=   ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(

     style: TextButton.styleFrom(
       //todo  0xFFFF بالنسبة للون بتكتب قبله
     // ignore: use_full_hex_values_for_flutter_colors
     backgroundColor:const Color(0xFFFF44A3C4),
     ),
    ),
textTheme: const TextTheme(

 headline4: TextStyle(fontWeight: FontWeight.w700,
     fontSize: 20),
    headline5: TextStyle(fontWeight: FontWeight.bold,
    color: Colors.black87,
    fontSize: 35),
    bodyText1: TextStyle(color: Colors.black)),
bottomNavigationBarTheme:   const BottomNavigationBarThemeData(
  selectedItemColor:   Color(0xffff44a3c4) ,
type: BottomNavigationBarType.fixed,
unselectedItemColor: Colors.black,
backgroundColor: Colors.white),
appBarTheme: const AppBarTheme(
titleTextStyle: TextStyle(color: Colors.black,
fontSize: 20,
fontWeight: FontWeight.bold),
iconTheme: IconThemeData(
color: Colors.black
),
backgroundColor: Colors.white

)
//primarySwatch: Colors.orange,

);
final darkTheme= ThemeData(
textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
unselectedItemColor: Colors.white,
backgroundColor: Colors.black26),
appBarTheme: const AppBarTheme(
titleTextStyle: TextStyle(color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.bold),
iconTheme: IconThemeData(
color: Colors.white
),
backgroundColor: Colors.black12

),
scaffoldBackgroundColor:   Colors.white10
);