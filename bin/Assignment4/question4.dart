void main() {
  void printItems(List<String> list, {String tilte = "Item List"}) {
    print("$tilte :");
    for (var i = 0; i < list.length; i++) {
      print("${i + 1} ${list[i]} ");
    }
  }

  printItems(["Apples", "Mango", "Grapes"], tilte:"Fruits");
  printItems(["Apples", "Mango", "Grapes"]);
}
