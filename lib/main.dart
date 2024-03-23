import 'package:cross_platform/WebWidget.dart';
import 'package:cross_platform/AndroidWidget.dart';
import 'package:cross_platform/WindowsWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          indicatorColor: Colors.purple,
          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.account_box), label: 'Page 1'),
            NavigationDestination(
                icon: Icon(Icons.ad_units_rounded), label: 'Page 2'),
            NavigationDestination(icon: Icon(Icons.abc_sharp), label: 'Page 3')
          ]
      ),
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: <Widget>[
        const WebWidget(),
        const AndroidWidget(),
        const WindowsWidget()
      ][currentPageIndex]
    );
  }
}
