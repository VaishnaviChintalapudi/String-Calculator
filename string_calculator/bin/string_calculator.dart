int addNumbers(String numbers) {
  if (numbers.isEmpty) return 0;

  var splitParts = numbers.split(',');
  return splitParts.map(int.parse).reduce((a, b) => a + b);
}
