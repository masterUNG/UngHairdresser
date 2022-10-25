// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImageInternet extends StatelessWidget {
  final String path;
  final double? size;
  const WidgetImageInternet({
    Key? key,
    required this.path,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      path,
      width: size,
      height: size,
    );
  }
}
