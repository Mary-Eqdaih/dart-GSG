void main() {
  // this does two things 1-validating 2-printing => Two Reasons To Change
  void registerUser({required String username, required String email}) {
    if (email.contains("@")) {
      print("User $username Registered With Email $email");
    } else {
      print("Invalid Email");
    }
  }

  registerUser(username: "Mary", email: "maryeqdaih@gmail.com");
  registerUser(username: "Mary", email: "maryeqdaihgmail.com");

  // Using Single  Responsibility Principle (SOLID Principles)
  // function  should have only one reason to change, it should do only one thing.

  // Function To Validate Email:  does one thing and can only change for one reason (If the email validation rules change.)
  bool validateEmail({required String email}) {
    return email.contains("@");
  }

  // Function To Print username And Email => does one thing and can only change for one reason (If output method changes.)
  void registerUser2({required String username, required String email}) {
    print("User $username Registered With Email $email");
  }

  void processUserRegistration({
    required String username,
    required String email,
  }) {
    if (validateEmail(email: email)) {
      registerUser2(username: username, email: email);
    } else {
      print("Invalid email");
    }
  }

  processUserRegistration(username: "Mary", email: "maryeqdaih@gmail.com");
  processUserRegistration(username: "Mary", email: "maryeqdaihgmail.com");
}
