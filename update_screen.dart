import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx_proj/main.dart';
import 'util/statesave.dart';

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
    var imagepicked = picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = imagepicked as String?;
    });
    Navigator.pop(context);
  }

  gallery() async {
    var imagepicked = picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = imagepicked as String?;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  gallery();
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: image == null
                      ? Text('choose image')
                      : Image.asset("$image"),
                ),
              ),
              InkWell(
                onTap: () {
                  camera();
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: image == null
                      ? Text('choose image')
                      : Image.asset("$image"),
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "name",
                    labelText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: email,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  stateSave.image(image);
                  stateSave.name(name.text);
                  stateSave.email(email.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UpdateScreen()));
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
    );
  }
}
