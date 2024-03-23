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

  List<String> texts = [];
  TextEditingController _page2Controller = TextEditingController();

  void addtext(){
    String text = _page2Controller.text;
    if (text.isNotEmpty){
      setState(() {
        texts.add(text);
        _page2Controller.clear();
      });
    }
  }
  void deletetext(item){
    if (texts.contains(item)){
      setState(() {
        texts.remove(item);
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
        Column(
          children: [
            Column(
                children: [
                  Text("Column"),
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
                  )
                ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: texts.map((item) => TextButton(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(item)),
                onPressed:() {deletetext(item);},
              )).toList(),
            )
          ]
        ),
        Column(
            children: <Widget>[
              Text("ListView"),
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
              ListView(
                shrinkWrap: true,
                children: texts.map((item) => GestureDetector(
                    key:ValueKey(item),
                    onTap: () => deletetext(item),
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item, textAlign: TextAlign.center))
                )).toList(),
              )
            ]
        ),
        Column(
          children: <Widget>[
            Text("ListView.separated"),
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
            ListView.separated(
              itemCount: texts.length,
              padding: EdgeInsets.all(16.0),
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index){
                return Divider(height: 20, color: Colors.deepPurple,  thickness: 1);
                },
              itemBuilder: (BuildContext context, int index){
                return TextButton(
                    child: Text(texts[index]),
                    onPressed: () {deletetext(texts[index]);}
                );},
            )
          ],
        )
      ][currentPageIndex],
    );
  }
}