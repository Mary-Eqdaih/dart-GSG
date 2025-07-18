import 'dart:io';

void main() {
  print("Enter The First Number ");
  num num1 = num.parse(stdin.readLineSync()!);
  print("Enter The Second Number");
  num num2 = num.parse(stdin.readLineSync()!);
  print("num1 = $num1 ");
  print("num2 = $num2 ");
  // Casting
  int intnum1 = num1.toInt();
  int intnum2 = num2.toInt();
  print("num1 After Casting => $intnum1 And Its Type Is ${intnum1.runtimeType}");
  print("num2 After Casting => $intnum2 And Its Type Is ${intnum2.runtimeType}");
  // i did casting first so if the user enters a double the result wont be accurate when checking for even and odd numbers 
  // Casting ensures we work with integers when checking even/odd, since %2 on decimals is unreliable


  // Check the condition using a ternary operator
  String result =
      ((intnum1 % 2 == 1 && intnum2 % 2 == 0) ||
          (intnum1 % 2 == 0 && intnum2 % 2 == 1))
      ? 'true:both numbers are positive OR one of the nums is even and the other is odd '
      :  'Condition not met: either not positive or both are even/odd';
  print(result);
  // incrementing and decrementing
  num1++;
  num2--;
  print('num1 after increment $num1,\nnum2 after decrement:= $num2');

  // Bitwise NOT of intNum1
  int bitwiseNot = ~intnum1;
  print('Bitwise NOT of num1 (intnum1) After Casting : $bitwiseNot');

  // Comparison using ternary operator
  String checkNumbers = (num1 > num2)
      ? 'True: num1 > num2'
      : 'False: num1 <= num2';
  print(checkNumbers);
}
// Mary Eqdaih