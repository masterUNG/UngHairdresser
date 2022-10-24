import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/states/create_account.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/widgets/widget_button.dart';
import 'package:unghairdresser/widgets/widget_form.dart';
import 'package:unghairdresser/widgets/widget_images.dart';
import 'package:unghairdresser/widgets/widget_text.dart';
import 'package:unghairdresser/widgets/widget_text_button.dart';

class Authen extends StatelessWidget {
  const Authen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
          child: SizedBox(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            child: Column(
              children: [
                newHead(),
                WidgetForm(
                  hint: 'Email :',
                  iconData: Icons.email_outlined,
                  changeFunc: (String string) {},
                ),
                WidgetForm(
                  hint: 'Password :',
                  iconData: Icons.lock_outline,
                  changeFunc: (String string) {},
                ),
                WidgetButton(
                  label: 'Login',
                  pressFunc: () {},
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
}
