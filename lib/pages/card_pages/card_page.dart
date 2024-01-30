import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wallet/controllers/wallet_bd.dart';
import 'package:wallet/controllers/cubit/card_cubit.dart';
import 'package:wallet/pages/card_pages/add_card_page.dart';
import 'package:wallet/pages/card_pages/view_card_page.dart';
import 'package:wallet/pages/welcome_pages.dart/second_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPage extends StatefulWidget {
  CardPage({super.key});
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final TextEditingController searchController = TextEditingController();
  List<CardData> list = [];
  @override
  void initState() {
    context.read<CardCubit>().loadCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 198, 198),
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Дисконтные карты',
              style: GoogleFonts.gabriela(
                color: Color.fromARGB(255, 50, 43, 85),
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (value) {
                      if (context.read<CardCubit>().state is CardLoaded) {
                        if (value.length > 2) {
                          list = (context.read<CardCubit>().state as CardLoaded)
                              .list
                              .where((element) => element.name.contains(value))
                              .toList();
                          setState(() {});
                        } else if (value.isEmpty) {
                          list = (context.read<CardCubit>().state as CardLoaded)
                              .list;
                          setState(() {});
                        }
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Поиск",
                        hintStyle: const TextStyle(color: Colors.white70),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(4),
                        prefixIcon: const Icon(Icons.search),
                        fillColor: Color.fromARGB(150, 198, 171, 249),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none)),
                  ))),
          BlocBuilder<CardCubit, CardState>(
            builder: (context, state) {
              if (state is CardLoaded) {
                if (list.isEmpty) {
                  list = (context.read<CardCubit>().state as CardLoaded).list;
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: CardViewPage(index: index)),
                            );
                          },
                          child: Text(list[index].name)),
                    );
                  },
                );
              } else if (state is CardEmpty) {
                return Center(
                    child: Text(
                  "Добавьте карту",
                  style: GoogleFonts.gabriela(
                    color: Color.fromARGB(255, 50, 43, 85),
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
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
                        type: PageTransitionType.rightToLeft,
                        child: AddCardPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 50, 43, 85)),
                  ),
                  child: Text(
                    "Добавить карту",
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
