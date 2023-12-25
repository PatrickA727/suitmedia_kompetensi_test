// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prov/providerr.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  TextEditingController Text_Controller = TextEditingController();
  bool PalindromeStatus = false;

  void Palindrome_Check() {
  String input = Text_Controller.text.replaceAll(RegExp(r'\s'), ''); // Remove spaces
  String reversedInput = String.fromCharCodes(input.runes.toList().reversed);

  bool PalindromeStatus = input.toLowerCase() == reversedInput.toLowerCase();
  
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Palindrome Status: '),
        content: Text(PalindromeStatus ? 'Is Palindrome' : 'Not Palindrome'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/smbg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,                  
                  children: [
                    const SizedBox(height: 200),
                    Image.asset('lib/images/p.png'),
                    const SizedBox(height: 50),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
                          onChanged: (value) {
                            Provider.of<UserProvider>(context, listen: false).setUsername(value);
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15), ),
                            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15), ),
                            labelText: 'Name', labelStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          controller: Text_Controller,
                          style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
                          onChanged: (value) {
                            
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15), ),
                            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15), ),
                            labelText: 'Palindrome', labelStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 18),
                          ),
                        ),
                      ),
                    ),  
                    const SizedBox(height: 50),
                     ElevatedButton(                      
                        onPressed: () {
                          Palindrome_Check();
                        },
                        child: Text('CHECK', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2B637B),
                          minimumSize: Size(338, 48),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                     const SizedBox(height: 20),
                     ElevatedButton(
                      onPressed: () {
                          Navigator.pushNamed(context, '/PageTwo');
                      },
                      child: Text('NEXT', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2B637B),
                        minimumSize: Size(338, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),          
                  ],
                ),
              ),          
            ],
          ),
        );
      }
    }