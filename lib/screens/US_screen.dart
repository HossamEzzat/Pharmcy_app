import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/profile_screen.dart';
import '../constant/color.dart';

class UsScreen extends StatelessWidget {
  const UsScreen({Key? key}) : super(key: key);

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
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ProfileScreen(),
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

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20,left: 30),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(image: AssetImage('assets/images/Vector.png'),),
                                    SizedBox(
                                      width:10,
                                    ),
                                    GradientText(
                                        "US?!",
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        colors: [
                                          firstMainColor,
                                          secondMainColor,
                                        ]
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                              height: 70,
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF764BA2),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Technical Team",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: firstMainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 70,
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF764BA2),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Medical Team",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: firstMainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}
