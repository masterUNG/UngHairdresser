import 'package:flutter/material.dart';

class MyConstant {
  static String urlAvatar = 'https://firebasestorage.googleapis.com/v0/b/ungharidresser.appspot.com/o/hairdressor%2F403021_avatar_girl_user_young_child_icon.png?alt=media&token=750a7855-9b16-4796-95fc-ea2053cbc2b7';

  static var types = <String>[
    'Customer',
    'Hairdresser',
  ];

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
