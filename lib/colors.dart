import 'dart:ui';

String hexColor = "#E0DED8";
Color color =
    Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
