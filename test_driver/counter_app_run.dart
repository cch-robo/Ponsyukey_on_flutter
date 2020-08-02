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
import 'package:flutter_driver/driver_extension.dart';
import 'counter_app.dart' as app;
// import 'package:reception_app/main.dart' as app;

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  app.main();
}
