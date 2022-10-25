// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/widgets/widget_process.dart';
import 'package:unghairdresser/widgets/widget_text.dart';
import 'package:unghairdresser/widgets/widget_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void processDialog() {
    Get.dialog(WillPopScope(
      child:  WidgetProcess(color: MyConstant.bg,),
      onWillPop: () async {
        return false;
      },
    ));
  }

  void normalDialog({required String title, required String subTitle}) {
    Get.dialog(
      AlertDialog(
        icon: Icon(
          Icons.alarm,
          size: 48,
          color: MyConstant.active,
        ),
        title: WidgetText(
          text: title,
          textStyle: MyConstant().h2Style(),
        ),
        content: WidgetText(text: subTitle),
        actions: [
          WidgetTextButton(
            label: 'Cancel',
            pressFunc: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
