import 'package:flutter/widgets.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constant/color.dart';

Widget gradientText (String text){
  return GradientText(
    text,
    style: const TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
    ),
    colors:  [
      firstMainColor,
      secondMainColor,
    ],
  );
}