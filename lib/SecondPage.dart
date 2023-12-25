// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/prov/providerr.dart';
import 'package:suitmedia_test/prov/providerrr.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {

  @override
  Widget build(BuildContext context) {
    String username = Provider.of<UserProvider>(context).username;
    String usernamee = Provider.of<UserProviderr>(context).namee;
    return Scaffold(

      appBar: AppBar(        
        backgroundColor: Colors.white,
        centerTitle: true,
        title: 
          Text('Second Screen', style: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),            
      ),
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Welcome', style: GoogleFonts.poppins(color: Colors.black, fontSize: 15))),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$username', style: GoogleFonts.poppins(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold))),
            const SizedBox(height: 200),
            Align(
              alignment: Alignment.center,
              child: Text(
                usernamee.isEmpty ? 'Selected User Name' : usernamee,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/PageThree');
                },
                child: Text('Choose A User', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2B637B),
                  minimumSize: Size(338, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}