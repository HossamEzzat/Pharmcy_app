import 'package:flutter/material.dart';

import '../constant/color.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  final String text;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors:  [
            firstMainColor,
            secondMainColor,
          ],
        ),
      ),
      width: 250,
      height: 70,
      child: TextButton(
        onPressed: onPress as void Function(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
