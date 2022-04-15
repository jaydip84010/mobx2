import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx_proj/main.dart';
import 'log_in_screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  ImagePicker picker = ImagePicker();
  String? image;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  camera() async {
    var imagepicked = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 200, maxWidth: 200);
    setState(() {
      image = imagepicked?.path??"";
    });
  }

  gallery() async {
    var imagepicked = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    setState(() {
      image = imagepicked?.path??"";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    child: image == null
                        ? Text('image not selected')
                        : Image.file(File(image!))),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        gallery();
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Center(child: Text('Gallery')),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        camera();
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Center(child: Text('camera')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "name",
                      labelText: 'name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  controller: name,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "email",
                      labelText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  controller: email,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    stateSave.changeImage(image!);
                    stateSave.changeName(name.text);
                    stateSave.changeEmail(email.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    color: Colors.green,
                    child: Center(child: Text('update')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
