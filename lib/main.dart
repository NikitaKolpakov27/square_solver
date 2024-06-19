import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:square_example/redux/actions.dart';
import 'package:square_example/redux/app_state.dart';
import 'package:square_example/redux/reducers.dart';

void main() {
  final Store<AppState> store = Store(reducer, initialState:
    AppState(result: '', a: 1, b: 1, c: 1)
  );
  runApp(StoreProvider(store: store, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Square example',
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
  int a = 1;
  int b = 1;
  int c = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Решатор квадратного уравнения',
              style: TextStyle(fontSize: 24),
            ),
            const Divider(
              endIndent: double.infinity,
            ),
            Container(
              width: 200,
              height: 75,
              child: Column(
                children: [
                  const Text(
                    'a:',
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) => a = int.parse(value),
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: double.infinity,
            ),
            Container(
              width: 200,
              height: 75,
              child: Column(
                children: [
                  const Text(
                    'b:',
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) => b = int.parse(value),
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: double.infinity,
            ),
            Container(
              width: 200,
              height: 75,
              child: Column(
                children: [
                  const Text(
                    'c:',
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) => c = int.parse(value),
                  ),
                ],
              ),
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                  'Result is: ${store.state.result}',
                  style: const TextStyle(fontSize: 25, color: Colors.pink),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => store.dispatch(Solve(a: a, b: b, c: c)),
                  child: const Icon(Icons.play_arrow),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
