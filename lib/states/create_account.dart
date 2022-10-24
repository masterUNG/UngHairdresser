import 'package:flutter/material.dart';
import 'package:unghairdresser/utility/my_constant.dart';
import 'package:unghairdresser/utility/my_dialog.dart';
import 'package:unghairdresser/widgets/widget_button.dart';
import 'package:unghairdresser/widgets/widget_form.dart';
import 'package:unghairdresser/widgets/widget_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var types = <String>[
    'Customer',
    'Hairdresser',
  ];

  String? type, name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.bg,
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        child: Center(
          child: Column(
            children: [
              WidgetForm(
                hint: 'Name :',
                iconData: Icons.fingerprint,
                changeFunc: (p0) {
                  name = p0.trim();
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: 250,
                child: DropdownButton(
                  items: types
                      .map(
                        (e) => DropdownMenuItem(
                          child: WidgetText(text: e),
                          value: e,
                        ),
                      )
                      .toList(),
                  hint: WidgetText(
                    text: 'Please Choose Type User',
                    textStyle: MyConstant().h3ActiveStyle(),
                  ),
                  value: type,
                  onChanged: (value) {
                    type = value;
                    setState(() {});
                  },
                ),
              ),
              WidgetForm(
                hint: 'Email :',
                iconData: Icons.email_outlined,
                changeFunc: (p0) {
                  email = p0.trim();
                },
              ),
              WidgetForm(
                hint: 'Password :',
                iconData: Icons.lock_outline,
                changeFunc: (p0) {
                  password = p0.trim();
                },
              ),
              WidgetButton(
                label: 'Create Account',
                pressFunc: () {
                  if ((name?.isEmpty ?? true) ||
                      (email?.isEmpty ?? true) ||
                      (password?.isEmpty ?? true)) {
                    MyDialog(context: context).normalDialog(
                        title: 'Have Space ?',
                        subTitle: 'Please Fill Every Blank');
                  } else if (type == null) {
                    MyDialog(context: context).normalDialog(
                        title: 'No Type User ?',
                        subTitle: 'Please Choose Type User');
                  } else {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
