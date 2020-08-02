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
// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    /*
    final homePageFinder = find.byValueKey('page');
    */
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), '0');
    });

    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // 注意：FlutterDriver オブジェクトには、
      // 　　　表示中ページのオブジェクト自体を取得するメソッドはない。
      // 　　　よって、_counter 値を直接参照する手段はない。
      /*
      Map<String, Object> map = await driver.getWidgetDiagnostics(homePageFinder);
      print("MyHomePage widget{");
      map.forEach((String key, Object value) { print("  $key=${value.toString()}"); });
      print("}");
      */

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), '1');
    });
  });
}
