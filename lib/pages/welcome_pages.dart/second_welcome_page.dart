import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';

class SecondWelcomePage extends StatelessWidget {
  const SecondWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Храните документы',
                  style: GoogleFonts.gabriela(
                    color: Color.fromARGB(255, 50, 43, 85),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              Spacer(),
              Image.asset("images/documents.webp"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 29,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 43, 85),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType
                                .rightToLeft,
                            child: ThirdWelcomePage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 50, 43, 85)),
                      ),
                      child: Text(
                        "Продолжить",
                        style: GoogleFonts.gabriela(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ]),
      ),
    );
  }
}
