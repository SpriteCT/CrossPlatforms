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
      home: const MyHomePage(title: 'MyDemoPage'),
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
  List<String> page2texts = [];
  TextEditingController _page2Controller = TextEditingController();

  void addtext(){
    String text = _page2Controller.text;
    if (text.isNotEmpty){
      setState(() {
        page2texts.add(text);
        _page2Controller.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
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
        const Text("""INDEX 0
        Саранцев Антон Игоревич
              БСБО-12-22
              22Б0745"""),
        Column(
          children: <Widget>[
            TextFormField(
              controller: _page2Controller,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: addtext,
              child: Text('Добавить элемент'),
            ),
            ListView.builder(
                itemCount: page2texts.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Align(

                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(page2texts[index]))
                  );
                }
            )]
        ),
        const Text('INDEX 2')
      ][currentPageIndex],
    );
  }
}