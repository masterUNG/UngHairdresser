// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFunc;
  final TextInputType? textInputType;
  final bool? obsecu;

  const WidgetForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFunc,
    this.textInputType,
    this.obsecu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(obscureText: obsecu ?? false,
        keyboardType: textInputType,
        onChanged: changeFunc,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: Icon(iconData),
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
