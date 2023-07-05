
import 'package:flutter/material.dart';
import 'package:untitled/screens/register_screen.dart';

import '../widgets/gradient_text.dart';
import '../widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Image(
              height: 250,
              width: 250,
              image: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              height: 80,
            ),
            gradientText("Hello!\nPharmacists"),
            SizedBox(
              height: 100,
            ),
            MainButton(
              text: 'Get Started',
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => RegisterScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
