import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/models/user_model.dart';
import 'package:unghairdresser/states/create_account.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/utility/my_dialog.dart';
import 'package:unghairdresser/widgets/widget_button.dart';
import 'package:unghairdresser/widgets/widget_form.dart';
import 'package:unghairdresser/widgets/widget_images.dart';
import 'package:unghairdresser/widgets/widget_text.dart';
import 'package:unghairdresser/widgets/widget_text_button.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
          child: SizedBox(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  newHead(),
                  WidgetForm(
                    hint: 'Email :',
                    iconData: Icons.email_outlined,
                    changeFunc: (String string) {
                      email = string.trim();
                    },
                    textInputType: TextInputType.emailAddress,
                  ),
                  WidgetForm(
                    hint: 'Password :',
                    iconData: Icons.lock_outline,
                    changeFunc: (String string) {
                      password = string.trim();
                    },
                    obsecu: true,
                  ),
                  WidgetButton(
                    label: 'Login',
                    pressFunc: () {
                      if ((email?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        MyDialog(context: context).normalDialog(
                            title: 'Have Space ?',
                            subTitle: 'Please Fill Every Blank');
                      } else {
                        processCheckLogin();
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const WidgetText(text: 'Non Account ? '),
                      WidgetTextButton(
                        label: 'Create Account',
                        pressFunc: () {
                          Get.to(const CreateAccount());
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container newHead() {
    return Container(
      margin: const EdgeInsets.only(top: 60, left: 32),
      child: Row(
        children: [
          const WidgetImage(
            size: 100,
          ),
          WidgetText(
            text: 'Ung \nHairdresser',
            textStyle: MyConstant().h1Style(),
          )
        ],
      ),
    );
  }

  Future<void> processCheckLogin() async {
    MyDialog(context: context).processDialog();

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) async {
      var user = value.user;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .get()
          .then((value) {
        Get.back();

        UserModel userModel = UserModel.fromMap(value.data()!);
        String typeUser = userModel.typeUser;
        print('typeUser => $typeUser');

        switch (typeUser) {
          case 'Customer':
            Get.offNamed(MyConstant.keyCustomer);
            break;

          case 'Hairdresser':
            Get.offNamed(MyConstant.keyHairdresser);
            break;

          default:
        }
      });
    }).catchError((onError) {
      Get.back();

      MyDialog(context: context)
          .normalDialog(title: onError.code, subTitle: onError.message);
    });
  }
}
