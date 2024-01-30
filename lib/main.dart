import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/controllers/cubit/card_cubit.dart';
import 'package:wallet/controllers/cubit/document_cubit.dart';
import 'package:wallet/pages/card_pages/add_card_page.dart';
import 'package:wallet/pages/card_pages/card_page.dart';
import 'package:wallet/pages/document_pages/document_add_page.dart';
import 'package:wallet/pages/document_pages/document_page.dart';
import 'package:wallet/pages/document_pages/document_shablon_page.dart';
import 'package:wallet/pages/document_pages/passport_view_page.dart';
import 'package:wallet/pages/document_pages/polis_oms_page.dart';
import 'package:wallet/pages/document_pages/snils_view_page.dart';
import 'package:wallet/pages/welcome_pages.dart/first_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/second_welcome_page.dart';
import 'package:wallet/pages/welcome_pages.dart/third_welcome_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardCubit(),
        ),
        BlocProvider(
          create: (context) => DocumentCubit(),
        ),
      ],
      child: MaterialApp(
        //   debugShowCheckedModeBanner: false, home: PolisOMSPage()),
         debugShowCheckedModeBanner: false, home: DocumentShablonPage()),
    );
  }
}
