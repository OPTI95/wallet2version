import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/controllers/cubit/card_cubit.dart';
import 'package:wallet/pages/card_pages/add_card_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';
import 'package:wallet/pages/welcome_pages.dart/second_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardViewPage extends StatelessWidget {
  final int index;
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController cvcCode = TextEditingController();
  CardViewPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    if ((context.read<CardCubit>().state as CardLoaded)
        .list[index]
        .cardNumber
        .toString()
        .isEmpty) {
      cardNumber.text = "Пусто";
    } else {
      cardNumber.text = (context.read<CardCubit>().state as CardLoaded)
          .list[index]
          .cardNumber
          .toString();
    }
    if ((context.read<CardCubit>().state as CardLoaded)
        .list[index]
        .cvcCode
        .toString()
        .isEmpty) {
      cvcCode.text = "Пусто";
    } else {
      cvcCode.text = (context.read<CardCubit>().state as CardLoaded)
          .list[index]
          .cvcCode
          .toString();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Spacer(),
                  Text(
                    (context.read<CardCubit>().state as CardLoaded)
                        .list[index]
                        .name,
                    style: GoogleFonts.gabriela(
                      color: Color.fromARGB(255, 50, 43, 85),
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () async {
                        await context.read<CardCubit>().updateCard(CardData(
                            id: (context.read<CardCubit>().state as CardLoaded)
                                .list[index]
                                .id,
                            name:
                                (context.read<CardCubit>().state as CardLoaded)
                                    .list[index]
                                    .name,
                            barcode:
                                (context.read<CardCubit>().state as CardLoaded)
                                    .list[index]
                                    .barcode,
                            cardNumber: cardNumber.text,
                            cvcCode: cvcCode.text));
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.save)),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: (context.read<CardCubit>().state as CardLoaded)
                  .list[index]
                  .barcode,
              width: 200,
              height: 100,
              color: Colors.black,
              drawText: true,
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Номер карты',
              style: GoogleFonts.gabriela(
                color: Color.fromARGB(255, 50, 43, 85),
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            TextField(
              controller: cardNumber,
              style: GoogleFonts.gabriela(
                color: Color.fromARGB(255, 50, 43, 85),
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
            Text(
              'CVC код',
              style: GoogleFonts.gabriela(
                color: Color.fromARGB(255, 50, 43, 85),
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
            TextField(
              controller: cvcCode,
              maxLength: 3,
              style: GoogleFonts.gabriela(
                color: Color.fromARGB(255, 50, 43, 85),
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed: () async {
                    int? id = (context.read<CardCubit>().state as CardLoaded)
                        .list[index]
                        .id;
                    await context.read<CardCubit>().deleteCard(id!);

                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: CardPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 50, 43, 85)),
                  ),
                  child: Text(
                    "Удалить карту",
                    style: GoogleFonts.gabriela(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }
}
