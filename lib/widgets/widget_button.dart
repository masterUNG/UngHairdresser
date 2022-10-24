// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/widgets/widget_text.dart';

class WidgetButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;

  const WidgetButton({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      width: 250,
      child: ElevatedButton(
          onPressed: pressFunc,
          child: WidgetText(
            text: label,
            textStyle: MyConstant().h3ButtonStyle(),
          )),
    );
  }
}
