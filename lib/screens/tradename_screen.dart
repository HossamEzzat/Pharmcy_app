import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../constant/color.dart';
import 'Augmentin_screen.dart';

class tradeScreen extends StatelessWidget {
  tradeScreen({Key? key, 
  required this.genericname, required this.tradename,
 })
      : super(key: key);
  final String genericname;
  final String tradename;

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
          Navigator.pop(context);
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
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/images/image 8.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GradientText("Generic Name",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            colors: [
                              firstMainColor,
                              secondMainColor,
                            ])
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                GradientText(
                  "$tradename",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  colors: [
                    firstMainColor,
                    secondMainColor,
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: 400,
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Color(0xff7552AB)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    "$genericname ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: firstMainColor,
                    ),
                  ),
                ),
              ])))
    ]));
  }
}
