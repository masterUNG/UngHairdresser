import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/bodys/all_hairdressor.dart';
import 'package:unghairdresser/bodys/choose_hairdressor.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/widgets/widget_drawer.dart';
import 'package:unghairdresser/widgets/widget_images.dart';
import 'package:unghairdresser/widgets/widget_menu_listtile.dart';
import 'package:unghairdresser/widgets/widget_text.dart';

class MainCustomer extends StatefulWidget {
  const MainCustomer({super.key});

  @override
  State<MainCustomer> createState() => _MainCustomerState();
}

class _MainCustomerState extends State<MainCustomer> {
  int indexBody = 0;
  var bodys = <Widget>[
    const AllHairdressor(),
    const ChooseHairdressor(),
  ];
  var titles = <String>[
    'ช่างทั้งหมด',
    'ช่างที่เลือกใช้งาน',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(
          text: titles[indexBody],
          textStyle: MyConstant().h2Style(),
        ),
      ),
      drawer: WidgetDrawer(
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetMenuListtile(
              leadWidget: const WidgetImage(
                path: 'images/menu1.png',
              ),
              title: titles[0],
              tapFunc: () {
                indexBody = 0;
                setState(() {});
                Get.back();
              },
            ),
            WidgetMenuListtile(
              leadWidget: const WidgetImage(
                path: 'images/menu2.png',
              ),
              title: titles[1],
              tapFunc: () {
                indexBody = 1;
                setState(() {});
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: bodys[indexBody],
    );
  }
}
