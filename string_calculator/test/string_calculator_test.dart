import 'dart:math';

import 'package:test/test.dart';

import '../bin/string_calculator.dart';

void main() {
  test("Returns 0 for empty string", () {
    expect(addNumbers(""), 0);
  });

  test("Returns the number if only one is provided", () {
    expect(addNumbers("10"), 10);
  });

  test("Returns the sum of two comma seperated numbers", () {
    expect(addNumbers("2,3"), 5);
  });

  test("Returns the sum of multiple comma seperated numbers", () {
    expect(addNumbers("1,2,3,4,5"), 15);
  });

  test("Testcase to handle new lines between numbers", () {
    expect(addNumbers("1\n2,3"), 6);
  });

  test("Testcase to handle new lines between numbers123", () {
    expect(addNumbers("//;\n1;2"), 3);
  });

  test("Testcase to verify the custom delimiters", () {
    expect(addNumbers("//@\n3@5\n5"), 13);
  });

  test("Testing for a negative number", () {
    expect(
        () => addNumbers("-2"),
        throwsA(predicate((err) =>
            err is Exception &&
            err.toString().contains("negative numbers not allowed [-2]"))));
  });

  test("Testing for multiple negative number", () {
    expect(
        () => addNumbers("-2,-3,-4"),
        throwsA(predicate((err) =>
            err is Exception &&
            err.toString().contains("negative numbers not allowed [-2, -3, -4]"))));
  });
}
