import 'package:demo/pages/first.dart';
import 'package:demo/pages/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MyHomePage(),
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
      },  
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // Navigate to First Page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(name: 'Helmut'),
                    ),
                ); // Navigator.of alternative
              }, // onPressed 
              child: const Text('First Page'),
            ), // TextButton mit alternativen Steuerung
            TextButton(
              onPressed: () async {
                // Navigate to Second Page
                final response = await Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: 'Julie',
                );
                debugPrint('Response from Second Page: $response');
              }, // onPressed
              child: const Text('Second Page'),
            ),
          ],
          ),
        ),
    );
  } // Widget build
} // _MyHomePageState