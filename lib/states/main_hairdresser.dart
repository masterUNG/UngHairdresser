import 'package:flutter/material.dart';
import 'package:unghairdresser/widgets/widget_drawer.dart';
import 'package:unghairdresser/widgets/widget_text.dart';

class MainHairdresser extends StatelessWidget {
  const MainHairdresser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(text: 'Hairdresser'),
      ),
      drawer: WidgetDrawer(),
    );
  }
}
