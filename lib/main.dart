import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WPPB Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'WPPB Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int prima = 0;
  String _text = "Ganjil";
  String _text2 = "Prima ";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _text = "Genap ";
      _text2 = "Prima ";

      if (_counter >= 20) _counter = 0;

      for (int i = 1; i <= _counter; i++) {
        if (i % 2 == 0){
          if (i % 3 == 0) _text += '${i}, ';
        }
      }

      for (int i = 0; i <= _counter; i++) {
        for (int n = 1; n <= i; n++) {
          if (i % n == 0) prima++;
        }
        if (prima == 2) {
          _text2 += '${i}, ';
        }
        prima = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Kamu sudah mengklik tombol sebanyak',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _text,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              _text2,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
