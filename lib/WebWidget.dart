import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class WebWidget extends StatelessWidget{
  const WebWidget({super.key});
  @override
  Widget build(BuildContext context){
    if (kIsWeb) return const Text("Web App");
    return const Text("Not a Web App");
  }
}