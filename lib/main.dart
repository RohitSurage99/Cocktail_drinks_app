import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:coctail_app/Homepage2.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Cocktail App",
     theme: ThemeData(
       primarySwatch: Colors.red,
     ),
     home: const Homepage2(),
   );
  }
}
