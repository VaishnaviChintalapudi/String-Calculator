import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test("Returns 0 for empty string", () {
    expect(add(null), 0);
  });

  test("Returns 0 for empty string", () {
    expect(add(""), 0);
  });

  test("Returns the number if only one is provided", () {
    expect(add("10"), 10);
  });

  test("Returns the sum of two comma seperated numbers", () {
    expect(add("2,3"), 5);
  });

  test("Returns the sum of multiple comma seperated numbers", () {
    expect(add("1,2,3,4,5"), 15);
  });

  test("Testcase to handle new lines between numbers", () {
    expect(add("1\n2,3"), 6);
  });

  test("Testcase to handle new lines between numbers", () {
    expect(add("//;\n1;2"), 3);
  });

  test("Testcase to verify the custom delimiters", () {
    expect(add("//@\n3@5\n5"), 13);
  });

  test("Handles custom delimiter with special characters", () {
    expect(add("//.\n1.2.3"), 6);
  });

  test("Handles numbers with spaces", () {
    expect(add(" 1 , 2 "), 3);
  });

  test("Testing for a negative number", () {
    expect(
        () => add("-2"),
        throwsA(predicate((err) =>
            err is Exception &&
            err.toString().contains("negative numbers not allowed [-2]"))));
  });

  test("Testing for multiple negative number", () {
    expect(
        () => add("-2,-3,-4"),
        throwsA(predicate((err) =>
            err is Exception &&
            err.toString()
                .contains("negative numbers not allowed [-2, -3, -4]"))));
  });

  test("Testing for multiple negative number", () {
    expect(
        () => add("-2,-3,-4,3,4,5"),
        throwsA(predicate((err) =>
            err is Exception &&
            err.toString()
                .contains("negative numbers not allowed [-2, -3, -4]"))));
  });
}
