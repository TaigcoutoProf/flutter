

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 215, 250),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // Logo
                width: 200,
                height: 200,
                color: Color.fromARGB(255, 51, 90, 139),
              ),
              Container(
                // Input email
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                height: 31,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E6F2),
                  border: Border.all(color: Color(0xFF535B9E),width: 0.2),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Digite seu e-mail", style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight(500)),),
                  ],
                ),
              ),
              Container(
                // Input senha
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                height: 31,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E6F2),
                  border: Border.all(color: Color(0xFF535B9E),width: 0.2),
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Digite sua senha",style: GoogleFonts.inter(fontSize: 12,fontWeight: FontWeight(500))),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}