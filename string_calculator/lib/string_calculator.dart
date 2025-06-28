int add(String? numbers) {
  // Return 0 if input is null or empty
  if (numbers == null || numbers.isEmpty) return 0;

  // Default delimiters: comma or newline
  String delimiterPattern = r'[,\n]';
  String numberSection = numbers;

  // Check for custom delimiter syntax at the beginning
  if (numbers.startsWith("//")) {
    // Find where the delimiter declaration ends
    final delimiterEnd = numbers.indexOf("\n");

    // Extract the custom delimiter from the declaration
    final delimiter = numbers.substring(2, delimiterEnd);

    // Extract the remaining part of the input after the delimiter line
    numberSection = numbers.substring(delimiterEnd + 1);

    // Escape the delimiter in case it has special regex characters
    // Include newline in the pattern to allow mixed delimiters
    delimiterPattern = '[${RegExp.escape(delimiter)}\n]';
  }

  // Split the number section using the resolved delimiter pattern
  final splitParts = numberSection.split(RegExp(delimiterPattern));

  // Convert parts to integers, ignoring empty or whitespace-only strings
  final parsedNumbers = splitParts
      .where((part) => part.trim().isNotEmpty)
      .map(int.parse)
      .toList();

  // Check for any negative numbers
  final negatives = parsedNumbers.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    // Throw an exception with all negative numbers listed
    throw Exception('negative numbers not allowed $negatives');
  }

  // Return the sum of all parsed integers using fold.
  return parsedNumbers.fold(0, (sum, n) => sum + n);
}
