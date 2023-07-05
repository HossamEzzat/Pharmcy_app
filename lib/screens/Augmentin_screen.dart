import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/constant/color.dart';
import 'package:untitled/screens/Active_Constituents_screen.dart';
import 'package:untitled/screens/P&L_screen.dart';
import 'package:untitled/screens/contraindications_screen.dart';
import 'package:untitled/screens/dictionary_screen.dart';
import 'package:untitled/screens/indication_screen.dart';
import 'package:untitled/screens/tradename_screen.dart';

class AugmentinScreen extends StatelessWidget {
  AugmentinScreen(
      {Key? key,
      required this.Generic_name,
      required this.Indication,
      required this.contraindication,
      required this.Pregnancy_and_lactation, 
      required this.Brand_name})
      : super(key: key);
  final String Brand_name;
  final String Generic_name;
  final String Indication;
  final String contraindication;
  final String Pregnancy_and_lactation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image(
        width: double.infinity,
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.fill,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => DictionaryScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 50,
            height: 50,
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 150),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(children: [
                SizedBox(
                  height: 40,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image(
                    image: AssetImage('assets/images/image 5.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GradientText("${Brand_name}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        firstMainColor,
                        secondMainColor,
                      ])
                ]),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => tradeScreen(
                          genericname : Generic_name,
                          tradename: Brand_name
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF764BA2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Generic Name",
                          style: TextStyle(
                            fontSize: 20,
                            color: firstMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/image 8.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => indicationScreen(
                          inducation: Indication,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF764BA2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Indication",
                          style: TextStyle(
                            fontSize: 20,
                            color: firstMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/image 9.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ContraindicationsScreen(
                          indextext : contraindication
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF764BA2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Contraindication",
                          style: TextStyle(
                            fontSize: 20,
                            color: firstMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/image 23.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => pregnancyScreen(
                          pregnancy:Pregnancy_and_lactation
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF764BA2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Pregnancy & Lactation",
                          style: TextStyle(
                            fontSize: 20,
                            color: firstMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/images/image 11.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ])))
    ]));
  }
}
