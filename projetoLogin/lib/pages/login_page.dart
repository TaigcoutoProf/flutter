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
          padding: EdgeInsets.fromLTRB(40, 100, 40, 200),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                // Logo
              Container(
                width: 200,
                height: 200,
                color: Color.fromARGB(255, 51, 90, 139),
              ),
              Column(
                spacing: 40,
                children: [
              // Input email
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E6F2),
                      border: Border.all(color: Color(0xFF535B9E),width: 0.2),
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Digite seu e-mail", style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight(400)),),
                      ],
                    ),
                  ),
                // Input senha
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E6F2),
                      border: Border.all(color: Color(0xFF535B9E),width: 0.2),
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Digite sua senha",style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight(400))),
                      ],
                    ),
                  ),
              ],
              ),
              // Botões
              Column(
                spacing: 20,
                children: [
                // Botao Login
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                      color: Color(0xFF244977),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login",style: GoogleFonts.inter(fontSize: 24,color: Color(0xFFFFFFFF),fontWeight: FontWeight(800))),
                      ],
                    ),
                  ),
                  // Botão Cadastro
                  Text("Cadastro",
                  style: GoogleFonts.inter(
                    fontSize: 20,color: Color(0xFF0B59BC),
                    fontWeight: FontWeight(500),
                    decoration: TextDecoration.underline, 
                    decorationColor: Color(0xFF0B59BC))),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}