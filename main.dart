import 'dart:core';

// Palindrome Checker
bool isPalindrome(String str) {
  final normalizedStr = str
      .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
      .toLowerCase();
  return normalizedStr == normalizedStr.split('').reversed.join('');
}

// Sorting Algorithms
List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;

  final pivot = list[list.length ~/ 2];
  final less = list.where((x) => x < pivot).toList();
  final equal = list.where((x) => x == pivot).toList();
  final greater = list.where((x) => x > pivot).toList();

  return quickSort(less) + equal + quickSort(greater);
}

List<int> bubbleSort(List<int> list) {
  final n = list.length;
  var arr = List<int>.from(list);

  for (var i = 0; i < n - 1; i++) {
    for (var j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        final temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }

  return arr;
}

// Basic Calculator
double calculate(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) throw ArgumentError('Cannot divide by zero');
      return num1 / num2;
    case '%':
      return num1 % num2;
    default:
      throw ArgumentError('Invalid operator');
  }
}

// Main function to run all functionalities
void main() {
  // Palindrome Checker Tests
  print('Palindrome Checker:');
  print(isPalindrome("A man, a plan, a canal, Panama")); // true
  print(isPalindrome("12321")); // true
  print(isPalindrome("Hello, World!")); // false

  // Sorting Algorithms Tests
  final list = [3, 6, 8, 10, 1, 2, 1];
  print('Sorting Algorithms:');
  final quickSorted = quickSort(list);
  print('Quick Sort: $quickSorted');
  final bubbleSorted = bubbleSort(list);
  print('Bubble Sort: $bubbleSorted');

  // Basic Calculator Tests
  print('Basic Calculator:');
  try {
    print(calculate(10, 5, '+')); // 15.0
    print(calculate(10, 5, '-')); // 5.0
    print(calculate(10, 5, '*')); // 50.0
    print(calculate(10, 5, '/')); // 2.0
    print(calculate(10, 5, '%')); // 0.0
    print(calculate(10, 0, '/')); // Throws error
  } catch (e) {
    print(e);
  }
}
