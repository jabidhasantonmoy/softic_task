import 'package:flutter/material.dart';

const Color backgroundColor = Colors.white;
const Color primaryColor1 = Color(0xFFF37F61);
const Color primaryColor2 = Color(0xFFDA4A2F);
const Color inactiveDotColor = Color(0xFFCCCCCC);

const Color bodyTextDarkColor = Color(0xFF231F20);
const Color textFieldBgColor = Color.fromARGB(255, 255, 255, 255);
const Color buttonColorMain = Color(0xFFDA4A2F);
const Color headerColorDark = Color(0xFF374957);
const Color darkRedColor = Color(0xFFB72E25);

LinearGradient grad1 = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFF37F61),
    Color(0xFFFAB692),
  ],
);

LinearGradient grad2 = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFB72E25),
    Color(0xFFDA4A2F),
  ],
);

LinearGradient grad3 = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFF8F8F8),
    Color(0xFFF8F8F8),
  ],
);

List<BoxShadow> boxShadow1 = [
  BoxShadow(
    color: Colors.black.withOpacity(.1),
    blurRadius: 10,
    offset: const Offset(0, 4),
    spreadRadius: 0,
    blurStyle: BlurStyle.normal,
  ),
];
