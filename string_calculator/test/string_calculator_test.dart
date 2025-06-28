import 'package:test/test.dart';

import '../bin/string_calculator.dart';

void main() {
  test("Returns 0 for empty string", () {
    expect(addNumbers(""), 0);
  });
}
