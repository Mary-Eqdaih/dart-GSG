import 'dart:io';

void main() {
  print('Enter number of days: ');
  int totalDays = int.parse(stdin.readLineSync() ?? "0");

  int years = totalDays ~/ 365;
  int remainingDays = totalDays % 365;

  int months = remainingDays ~/ 30;
  int days = remainingDays % 30;

  int hours = totalDays * 24;
  int minutes = hours * 60;

  int seconds = minutes * 60;

  print('$totalDays days are :');
  print(
    '$years year(s), $months month(s),  $days day(s), $hours hour(s), $minutes minute(s) and $seconds second(s) ',
  );
}
// Mary Eqdaih