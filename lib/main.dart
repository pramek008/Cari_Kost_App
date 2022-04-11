// ignore: unused_import
import 'package:findhouse/pages/homePage.dart';
import 'package:findhouse/providers/spaceProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:findhouse/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(FindHouse());

class FindHouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: SplashPage(),
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      ),
    );
  }
}
