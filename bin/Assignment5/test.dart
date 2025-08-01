import 'student.dart';

void main() {
  // 4. Create student list
  List<Student> studentList = [];

  // 5. Add 3 students with only required fields
  studentList.add(Student(name: "Mary", grade: -1));
  studentList.add(Student(name: "Meera", grade: 90));
  studentList.add(Student(name: "Huda", grade: 100));

  // 6. Use setters to update at least two optional properties (email, address, or phone) for each student after they are added to the list.
  studentList[0].email = "maryeqdaih@gmail.com";
  studentList[0].address = "Gaza";
  studentList[1].email = "Meera@gmail.com";
  studentList[1].address = "Canada";
  studentList[2].email = "Hhhh@gmail.com";
  studentList[2].address = "France";

  //8.1
  print("*** List Of All Students And Their Properties : *** ");
  for (var i = 0; i < studentList.length; i++) {
    studentList[i].display();
  }

  //8.2
  print("==================================================================");
  print(
    "*** Search Results : If value = 80 and  a boolean to specify if greaterThan 80 ***",
  );
  List<Student> results = Student.search(studentList, 80, true);
  for (var s in results) {
    s.display();
  }
  print("==================================================================");
  print("*** After Updating : ***");
  studentList[2].phone = "12345678910";
  studentList[0].phone = "100200300400";
  studentList[1].phone = "102030405060";

  for (var i = 0; i < studentList.length; i++) {
    print(studentList[i].toString());
  }
  print("==================================================================");
  print("*** Sorting : ***");
  studentList.sort((a, b) => b.grade.compareTo(a.grade));
  for (var student in studentList) {
    print(student);
  }

  print("==================================================================");
  print("*** Students That passed : ***");
  for (var i = 0; i < studentList.length; i++) {
    if (studentList[i].isPassed()) {
      print(studentList[i].name);
    }
  }
}
