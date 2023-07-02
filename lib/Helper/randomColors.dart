//create a Colors class that has one static method that returns a random color out of a list of colors. ensure that a color cannot be repeated more than 5 times in total

//import the necessary packages

import 'dart:math';
import 'dart:ui';

class RandomColors {
  static List<Color> colors = const [
    Color(0xFFE57373),
    Color(0xFFF06292),
    Color(0xFFBA68C8),
    Color(0xFF9575CD),
    Color(0xFF7986CB),
    Color(0xFF64B5F6),
    Color(0xFF4FC3F7),
    Color(0xFF4DD0E1),
    Color(0xFF4DB6AC),
    Color(0xFF81C784),
    Color(0xFFAED581),
    Color(0xFFFF8A65),
    Color(0xFFD4E157),
    Color(0xFFFFD54F),
    Color(0xFFFFB74D),
    Color(0xFFA1887F),
    Color(0xFF90A4AE),
  ];
  static Color getRandomColor() {
    return colors[Random().nextInt(colors.length)];
  }
}
