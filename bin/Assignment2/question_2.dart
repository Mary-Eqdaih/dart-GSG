import 'dart:io';

void main() {
  // Step 1: Input a double number
  print("Enter a decimal number: ");
  double num = double.parse(stdin.readLineSync()!);

  // Step 2: Print ceil, floor, and round
  print("Ceiling of $num => ${num.ceil()}");
  print("Floor of $num => ${num.floor()}");
  print("Rounded value of $num => ${num.round()}");

  // Step 3: Concatenate with a string
  String output = "Value: $num";
  print(output);

  // Step 4: Check if num is larger than 10
  String size = (num > 10) ? "Large" : "Small";
  print("The number is: $size");

}
// Mary Eqdaih