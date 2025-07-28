void main() {
   // this does two things 1-validating 2-printing => Two Reasons To Change => doesnt follow Single responsibility principle
  void registerUser({required String username, required String email}) {
    print("User $username Registered With Email $email");
  }

  registerUser(username: "Mary", email: "maryeqdaih@gmail.com");
}
