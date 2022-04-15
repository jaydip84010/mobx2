import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_proj/main.dart';
import 'update_screen.dart';

class LOgInScreen extends StatefulWidget {
  const LOgInScreen({Key? key}) : super(key: key);

  @override
  State<LOgInScreen> createState() => _LOgInScreenState();
}

class _LOgInScreenState extends State<LOgInScreen> {
  String? images;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = stateSave.image;
    name.text = stateSave.name;
    email.text = stateSave.email;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SafeArea(
            child: Scaffold(
          body: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: Image.file(File(stateSave.image)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(stateSave.name),
                SizedBox(
                  height: 10,
                ),
                Text(stateSave.email),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateScreen()));
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    color: Colors.green,
                    child: Center(child: Text('Log in')),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
