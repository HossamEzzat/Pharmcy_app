import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'chatbot_screen.dart';
import 'dictionary_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            width: double.infinity,
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DictionaryScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF764BA2),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Dictionary",
                            style: TextStyle(
                              fontSize: 24,
                              color: firstMainColor,
                            ),
                          ),
                          Image(
                            image: AssetImage('assets/images/dictionary.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => chatScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 220,
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
                            "Case Study \nTraining",
                            style: TextStyle(
                              fontSize: 22,
                              color: firstMainColor,
                            ),
                          ),
                          Image(
                            height: 90,
                            width: 90,
                            image: AssetImage('assets/images/detection.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
