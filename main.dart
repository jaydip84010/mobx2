import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util/statesave.dart';
import 'screen/update_screen.dart';

StateSave stateSave = StateSave();

void main() {
  runApp(MaterialApp(
    home: UpdateScreen(),
  ));
}
