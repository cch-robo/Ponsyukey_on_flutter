/// counter_app 関連の integration test （自動挙動確認テスト）についての説明
/// counter_app.dart と counter_app_run.dart と counter_app_run_test は、
/// 結合テストのためのトリオとなるサンプルコード・ファイルです。
///
/// counter_app.dart     ⇒ カウンタアプリ本体
/// counter_app_run.dart ⇒ カウンタアプリのランチャーコード（アプリを自動挙動確認テストとして起動する）
/// counter_app_run_test ⇒ カウンタアプリの実働挙動確認テストコード
///
/// プロジェクト・ディレクトリ内で、以下を実行すると自動挙動確認テストが実行されます。
/// $ flutter drive --target=test_driver/counter_app_run.dart
///
/// 【参照】
///   An introduction to integration testing
///   https://flutter.dev/docs/cookbook/testing/integration/introduction
///
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Counter App',
      home: MyHomePage(key: Key('page'), title: 'Counter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // Provide a Key to this specific Text widget. This allows
              // identifing the widget from inside the test suite,
              // and reading the text.
              key: const Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
