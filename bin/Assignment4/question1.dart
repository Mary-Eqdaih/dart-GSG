void main() {
  void greet(String name, [String greeting = "Hello"]) {
    print("$greeting $name");
  }

  greet("Mary", "Welcome");
  greet("Mary");
}
