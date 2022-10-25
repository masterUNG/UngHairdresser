import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unghairdresser/models/user_model.dart';
import 'package:unghairdresser/states/detail_hairdresser.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/widgets/widget_process.dart';
import 'package:unghairdresser/widgets/widget_text.dart';

class AllHairdressor extends StatefulWidget {
  const AllHairdressor({super.key});

  @override
  State<AllHairdressor> createState() => _AllHairdressorState();
}

class _AllHairdressorState extends State<AllHairdressor> {
  var userModels = <UserModel>[];
  bool load = true;

  @override
  void initState() {
    super.initState();
    readAllHairdressor();
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? const WidgetProcess()
        : GridView.builder(
            itemCount: userModels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Get.to(DetailHairdresser(userModel: userModels[index]));
              },
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.network(
                          userModels[index].urlImage ?? MyConstant.urlAvatar),
                    ),
                    WidgetText(
                      text: userModels[index].name,
                      textStyle: MyConstant().h3ActiveStyle(),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future<void> readAllHairdressor() async {
    await FirebaseFirestore.instance
        .collection('user')
        .where('typeUser', isEqualTo: 'Hairdresser')
        .get()
        .then((value) {
      for (var element in value.docs) {
        UserModel userModel = UserModel.fromMap(element.data());
        userModels.add(userModel);
      }

      load = false;
      setState(() {});
    });
  }
}
