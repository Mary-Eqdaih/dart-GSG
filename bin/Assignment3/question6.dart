import 'dart:io';

void main() {
  print("Enter Your Username Please : ");
  String? userName = stdin.readLineSync();
  print("Enter Your Password Please : ");
  String? password = stdin.readLineSync();
  print("Enter Your Role (Admin/User) Please : ");
  String? role = stdin.readLineSync();

  if (userName == "manager") {
    if (password == "admin@123") {
      if (role == "admin") {
        print("Welcome Admin Manager! Full access granted.");
      } else {
        print("Access denied: Admin role required.");
      }
    } else {
      print("Incorrect password. Try again.");
    }
  } else if (userName == "guest") {
    if (password == "user@123") {
      if (role == "user") {
        print("Welcome Guest! Limited access granted.");
      } else {
        print("Access denied: Admin role required.");
      }
    } else {
      print("Incorrect password. Try again.");
    }
  } else {
    print("Unknown User");
  }
}
