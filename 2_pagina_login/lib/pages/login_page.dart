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
        body:Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(40, 100, 40, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // logo
              Container(
                width: 200,
                height: 200,
                color: Color.fromARGB(255, 51, 90, 139),
              ),
              //Grupo de inputs
              Column(
                spacing: 40,
                children: [
                  //input email
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E6F2),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Color(0xFF535B9E),
                        width: 0.2,
                      )
                    ),
                    child: Text("Digite seu e-mail",
                            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight(400)),
                            ),
                  ),
                  //input senha
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24 , 12, 24, 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E6F2),
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Color(0xFF535B9E),
                        width: 0.2,
                      )
                    ),
                    child: Text("Digite sua senha",
                            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight(400)),
                            ),
                  ),
                ],
              ),
              //Grupo de botões
              Column(
                spacing: 20,
                children: [
                  //botão login
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                      color: Color(0xFF244977),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF535B9E),
                        width: 0.2,
                      )
                    ),
                    child: Text("Login",
                            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight(800), color: Color(0xFFFFFFFF)),
                            ),
                  ),
                  //botão cadastro
                  Text("Cadastro",
                          style: GoogleFonts.inter(
                            fontSize: 20, 
                            fontWeight: FontWeight(500), 
                            color: Color(0xFF0B59BC),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF0B59BC)
                            ),
                          ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
