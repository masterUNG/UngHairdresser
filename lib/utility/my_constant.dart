import 'package:flutter/material.dart';

class MyConstant {
  static String keyAuthen = '/authen';
  static String keyCustomer = '/customer';
  static String keyHairdresser = '/hairdresser';

  static Color dark = Colors.black;
  static Color bg = Colors.white;
  static Color active = const Color.fromARGB(255, 92, 23, 104);

  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: dark,
        fontWeight: FontWeight.bold,
      );

       TextStyle h2Style() => TextStyle(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.w700,
      );

       TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

       TextStyle h3ActiveStyle() => TextStyle(
        fontSize: 16,
        color: active,
        fontWeight: FontWeight.bold,
      );

       TextStyle h3ButtonStyle() => TextStyle(
        fontSize: 16,
        color: bg,
        fontWeight: FontWeight.bold,
      );
}
