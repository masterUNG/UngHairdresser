// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:unghairdresser/models/user_model.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/widgets/widget_icon_button.dart';
import 'package:unghairdresser/widgets/widget_image_internet.dart';
import 'package:unghairdresser/widgets/widget_text.dart';

class DetailHairdresser extends StatefulWidget {
  final UserModel userModel;
  const DetailHairdresser({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<DetailHairdresser> createState() => _DetailHairdresserState();
}

class _DetailHairdresserState extends State<DetailHairdresser> {
  UserModel? userModel;
  DateTime dateTime = DateTime.now();
  DateFormat dateFormat = DateFormat('dd/MMM/yyyy');

  @override
  void initState() {
    super.initState();
    userModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(
          text: userModel!.name,
          textStyle: MyConstant().h2Style(),
        ),
      ),
      body: ListView(
        children: [
          WidgetImageInternet(
            path: userModel!.urlImage ?? MyConstant.urlAvatar,
            size: 250,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: ListTile(
                  title: WidgetText(
                    text: dateFormat.format(dateTime),
                    textStyle: MyConstant().h2Style(),
                  ),
                  trailing: WidgetIconButton(
                    iconData: Icons.calendar_month,
                    pressFunc: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
