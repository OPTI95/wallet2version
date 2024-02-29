import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerekrestokPage extends StatefulWidget {
  const PerekrestokPage({Key? key}) : super(key: key);

  @override
  _PerekrestokPageState createState() => _PerekrestokPageState();
}

class _PerekrestokPageState extends State<PerekrestokPage> {
  bool isRotate = false;
  String inputValue = "1245961482419504";
  String formattedValue = formatString("1245961482419504");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: Card(
                  color: const Color.fromRGBO(41, 94, 72, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            "images/perek.png",
                            color: Colors.white,
                            width: 250,
                          ),
                        ),
                        const Spacer(),
                        isRotate
                            ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BarcodeWidget(
                                  barcode: Barcode.code128(),
                                  data: inputValue,
                                  width: 200,
                                  height: 100,
                                  color: Colors.black,
                                  drawText: false,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                            )
                            : Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            "КЛУБ ПЕРЕКРЕСТОК",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "ОСНОВНАЯ КАРТА",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        formattedValue,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Color.fromARGB(
                                                255, 216, 216, 216)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isRotate = !isRotate;
                });
              },
              icon: Icon(Icons.refresh),
            )
          ],
        ),
      ),
    );
  }
}

String formatString(String input) {
  String formattedString = '';
  for (int i = 0; i < input.length; i++) {
    if (i % 4 == 0 && i != 0) {
      formattedString += '  ';
    }
    formattedString += input[i];
  }
  return formattedString;
}
