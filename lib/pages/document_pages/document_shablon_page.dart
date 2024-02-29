import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/controllers/cubit/card_cubit.dart';
import 'package:wallet/pages/card_pages/add_card_page.dart';
import 'package:wallet/pages/card_pages/view_card_page.dart';
import 'package:wallet/pages/document_pages/inn_view_page.dart';
import 'package:wallet/pages/document_pages/passport_view_page.dart';
import 'package:wallet/pages/document_pages/polis_oms_page.dart';
import 'package:wallet/pages/document_pages/snils_view_page.dart';
import 'package:wallet/pages/welcome_pages.dart/second_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentShablonPage extends StatelessWidget {
  DocumentShablonPage({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: 10,
      ),
      ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: PassportViewPage(
                  index: 0,
                ),
              ),
            );
          },
          title: Text(
            "Паспорт",
            style: GoogleFonts.gabriela(
              color: Color.fromARGB(255, 50, 43, 85),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.arrow_forward)),
      ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: SnilsViewPage(),
              ),
            );
          },
          title: Text(
            "СНИЛС",
            style: GoogleFonts.gabriela(
              color: Color.fromARGB(255, 50, 43, 85),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.arrow_forward)),
      ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: PolisOMSPage(),
              ),
            );
          },
          title: Text(
            "Полис ОМС",
            style: GoogleFonts.gabriela(
              color: Color.fromARGB(255, 50, 43, 85),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.arrow_forward)),
      ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: InnViewPage(),
              ),
            );
          },
          title: Text(
            "ИНН",
            style: GoogleFonts.gabriela(
              color: Color.fromARGB(255, 50, 43, 85),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.arrow_forward)),
    ]);
  }
}
