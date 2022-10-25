import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/controllers/app_controller.dart';
import 'package:unghairdresser/models/user_model.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    FirebaseAuth.instance.authStateChanges().listen(
      (event) async {
        if (event == null) {
          runApp(const MyApp());
        } else {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(event.uid)
              .get()
              .then((value) {
            UserModel userModel = UserModel.fromMap(value.data()!);
            switch (userModel.typeUser) {
              case 'Customer':
                keyPage = MyConstant.keyCustomer;
                 runApp(const MyApp());
                break;
              case 'Hairdresser':
                keyPage = MyConstant.keyHairdresser;
                 runApp(const MyApp());
                break;
              default:
            }
          });
        }
      },
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static AppController controller = Get.put(AppController());

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
