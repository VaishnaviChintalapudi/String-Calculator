int addNumbers(String numbers) {
  if (numbers.isEmpty) return 0;

  List<String> splitParts = [];
  if (numbers.startsWith("//")) {
    String delimter = numbers[2]; //Get the delimiter
    String subString =
        numbers.substring(4); //Get the substring after delimiters and newline
    RegExp regExp = RegExp(
        '[\n${RegExp.escape(delimter)}]'); //Create a regular expression with delimiters and newline
    splitParts = subString.split(regExp); //splitting the input based on Regex
    return splitParts.map(int.parse).reduce((a, b) => a + b); //finally add them
  }

  splitParts = numbers.split(RegExp(r'[,\n]'));
  return splitParts.map(int.parse).reduce((a, b) => a + b);
}
