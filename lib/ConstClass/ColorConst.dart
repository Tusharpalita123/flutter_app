import 'dart:ui';

class ColorConstant {
  static Color bluecolor = HexColor("003E7E");
  static Color colorprimary = HexColor("a5cc3c");
  static Color seccolor = HexColor("02adee");
  static Color sad = HexColor("e6f7fd");
  static Color redcolor = HexColor("C1032F");
  static Color blackcolor = HexColor("000000");
  static Color whitecolor = HexColor("ffffff");
  static Color bggreycolor = HexColor("dbdbdb");
  static Color textgrey = HexColor("777777");
  static Color bggrey = HexColor("d6d6d6");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
