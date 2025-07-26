import 'dart:io';

void main() {
  String? input;
  print("Enter Your Password Please :");
  input = stdin.readLineSync()!;
  while (input != "admin123") {
    print("Wrong Password Try Again :");
    input = stdin.readLineSync()!;
  }
  print("Access Granted");
}
