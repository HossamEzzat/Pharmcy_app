import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/Augmentin_screen.dart';
import '../constant/color.dart';

class ActiveScreen extends StatelessWidget {
  const ActiveScreen({Key? key}) : super(key: key);

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
                              padding: const EdgeInsets.only(top: 30,left: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image(image: AssetImage('assets/images/image 7.png'),),
                                    SizedBox(
                                      width:20,
                                    ),
                                    GradientText(
                                        "Active \nConstituents",
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
                              height: 30,
                            ),
                            GradientText(
                              "Augmentin",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: secondMainColor
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                "- active ingredients,  \namoxycillin and clavulanic acid.  \n-while clavvulanic acid stops the enzyme from rendering  \namoxycillin works towards killing the tuberculosis-causing bacteria ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: firstMainColor,
                                ),
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
