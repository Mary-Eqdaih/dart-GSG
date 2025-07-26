import 'dart:io';

void main() {
  print("Enter Your Exam Score Please :");
  int? input = int.parse(stdin.readLineSync()!);

  if (input < 0 || input > 100) {
    print("Invalid Score");
  } else if (input >= 90 && input <= 100  ) {
    print("Excellent You Got an A");
  }
   else if (input >= 80 && input <= 89) {
    print("Very Good You Got a B");
  }
   else if (input >= 70 && input <=79 ) {
    print("Good! You got C.");
  }
   else if (input < 70 ) {
    print("You need improvement. You got a D.");
  }
   
}
