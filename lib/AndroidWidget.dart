import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class AndroidWidget extends StatelessWidget{
  const AndroidWidget({super.key});
  @override
  Widget build(BuildContext context){
    if (Platform.isAndroid) return const Text("Android App");
    return const Text("Not a Android App");
  }
}