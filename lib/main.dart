import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/states/authen.dart';
import 'package:unghairdresser/states/main_customer.dart';
import 'package:unghairdresser/states/main_hairdresser.dart';
import 'package:unghairdresser/utility/my_constant.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: MyConstant.keyAuthen,
    page: () => const Authen(),
  ),
  GetPage(
    name: MyConstant.keyCustomer,
    page: () => const MainCustomer(),
  ),
  GetPage(
    name: MyConstant.keyHairdresser,
    page: () => const MainHairdresser(),
  ),
];

String keyPage = MyConstant.keyAuthen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: keyPage,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          backgroundColor: MyConstant.bg,
          foregroundColor: MyConstant.dark,
          elevation: 0,
        ),
      ),
    );
  }
}
