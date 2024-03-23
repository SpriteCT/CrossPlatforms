import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class WindowsWidget extends StatelessWidget{
  const WindowsWidget({super.key});
  @override
  Widget build(BuildContext context){
    if (Platform.isWindows) return const Text("Windows App");
    return const Text("Not a Windows App");
  }
}