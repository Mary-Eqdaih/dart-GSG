void main() {
  const List<int> nums = [2, 4, 6, 8, 10];
  print('List: $nums');
  Set set = nums.toSet();
  set.add(12);
  print('Set: $set');
  Map<int, int> map = {for (int num in set) num: num * 3};
  print('Map: $map');
}
// Mary Eqdaih