import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/chatbot_screen.dart';

import '../constant/color.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

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
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => chatScreen(),
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
                child: Icon(
                    Icons.arrow_back_ios
                ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                    padding: EdgeInsets.only(top: 30,left: 30),
                    child: GradientText("Your Scores",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: [
                          firstMainColor,
                          secondMainColor,
                        ])),
                SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              firstMainColor,
                              secondMainColor,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      GradientText("Congratulations",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                          colors: [
                            firstMainColor,
                            secondMainColor,
                          ]),
                    ],
                  ),
                ),
              ])))
    ],),);
  }
}
