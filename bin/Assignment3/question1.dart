import 'dart:io';

void main() {
  print("Enter Your Age Please :");
  int? input = int.parse(stdin.readLineSync()!);

  if (input >= 18) {
    print("You are eligible to vote");
  } else {
    print("You are not eligible to vote yet");
  }
}
