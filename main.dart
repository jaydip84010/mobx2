import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util/statesave.dart';
import 'screen/log_in_screen.dart';

StateSave stateSave = StateSave();

void main() {
  runApp(MaterialApp(
    home: LOgInScreen(),
  ));
}
