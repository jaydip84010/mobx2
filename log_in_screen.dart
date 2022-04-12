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
  var image;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = stateSave.image;
    name.text = stateSave.name;
    email.text = stateSave.email;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SafeArea(
            child: Form(
          child: Column(
            children: [
              Image(image: image),
              SizedBox(
                height: 10,
              ),
              TextFormField(controller: name),
              SizedBox(
                height: 10,
              ),
              TextFormField(controller: email),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UpdateScreen()));
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
        ));
      },
    );
  }
}
