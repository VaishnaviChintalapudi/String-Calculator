int addNumbers(String numbers) {
  if (numbers.isEmpty) return 0;

  List<String> splitParts = numbers.split(RegExp(r'[,\n]'));
  if (numbers.startsWith("//")) {
    String delimter = numbers[2]; //Get the delimiter
    String subString =
        numbers.substring(4); //Get the substring after delimiters and newline
    RegExp regExp = RegExp(
        '[\n${RegExp.escape(delimter)}]'); //Create a regular expression with delimiters and newline
    splitParts = subString.split(regExp); //splitting the input based on Regex
  }

  var list = splitParts.map(int.parse).toList();
  List<int> negatives = list.where((element) => element < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception("negative numbers not allowed $negatives");
  }
  return splitParts.map(int.parse).reduce((a, b) => a + b);
}
