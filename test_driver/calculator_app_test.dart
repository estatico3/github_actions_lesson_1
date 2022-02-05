import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  test("Should appear an empty page when launch the app", () async {
    driver.waitUntilFirstFrameRasterized();
    await driver.waitFor(find.text("No string entries"));
    await driver.tap(find.byType("Icon"));
    await driver.waitFor(find.text("Add string"));
    await driver.tap(find.byType("TextField"));
    await driver.enterText("Hello, world!");
    await driver.tap(find.text("Save"));
    await driver.waitForAbsent(find.text("Save"));
  });

  tearDownAll(() async {
    await driver.close();
  });
}
