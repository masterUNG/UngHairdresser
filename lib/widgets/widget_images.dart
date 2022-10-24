// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImage extends StatelessWidget {
  final double? size;
  const WidgetImage({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/logo.png',
      width: size,
    );
  }
}
