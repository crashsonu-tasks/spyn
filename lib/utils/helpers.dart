// All Flutter Built-in Imports Here.

// All Custom Imports Here.

// All Native Imports Here.

// All Attributes or Constants Here.

String capitalizeEveryWord(String input) {
  // Split the input string into words
  List<String> words = input.split(' ');

  // Capitalize the first letter of each word
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) {
      return word;
    } else {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
  }).toList();

  // Join the capitalized words back into a single string
  String capitalizedString = capitalizedWords.join(' ');

  return capitalizedString;
}
