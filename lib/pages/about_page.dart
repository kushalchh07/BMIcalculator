import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  
   AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 190, 161),
        title: Text(
          "About",
          style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("AboutPage."),
        ),
      ),
    );
  }
}
