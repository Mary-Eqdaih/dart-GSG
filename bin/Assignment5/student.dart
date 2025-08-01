//1. Define a class named Student with the following properties:
class Student {
  String _name;
  double _grade;
  String? _email;
  String? _address;
  String? _phone;
  // for all students
  static int _counter = 1;

  final int _id;
  // 2. Create a constructor for Student that requires only name and grade upon initialization.
  Student({required String name, required double grade})
    : _name = name,
      _grade = grade,
      // when object created the id will increament by one for each object
      _id = _counter++;

  // 3. Implement getters and setters for all properties.
  // Setters
  set name(String newName) {
    _name = newName;
  }

  set email(String? newEmail) {
    _email = newEmail;
  }

  set address(String? newAddress) {
    _address = newAddress;
  }

  set phone(String? newPhone) {
    _phone = newPhone;
  }

  set grade(double newGrade) {
    if (newGrade >= 0 && newGrade <= 100) {
      newGrade = _grade;
    } else {
      print("Invalid Grade");
    }
  }

  // Getters
  int get id => _id;
  String get name => _name;
  double get grade => _grade;
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;

  /*7. Write a function that searches for all students whose grades are either greater than or
  less than a specific value. (The function should accept the list, a grade value, and a boolean
  to specify greater/less.) */

  static List<Student> search(
    List<Student> studentlist,
    double grade,
    bool checkGreaterThan,
  ) {
    List<Student> students = [];

    for (var student in studentlist) {
      if (checkGreaterThan) {
        if (student.grade > grade) {
          students.add(student);
        }
      } else {
        if (student.grade < grade) {
          students.add(student);
        }
      }
    }

    return students;
  }

  // 8. Demonstrate usage
  // 8.1
  void display() {
    print("ID     : $_id");
    print("Name: $_name");
    print("Grade: $_grade");
    print("Email: ${_email ?? 'Not set'}");
    print("Address: ${_address ?? 'Not set'}");
    print("Phone: ${_phone ?? 'Not set'}");
    print("----------------------------------");
  }

  @override
  String toString() {
    return '''
Name   : $_name
Grade  : $_grade
Email  : ${_email ?? 'Not set'}
Address: ${_address ?? 'Not set'}
Phone  : ${_phone ?? 'Not set'}
----------------------------------''';
  }

  bool isPassed() {
  return _grade >= 60;
}

}
