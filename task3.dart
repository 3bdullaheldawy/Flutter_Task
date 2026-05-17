void main() {
  Set<String> users = {};

  addNewStudent(users, "Ahmed");
  addNewStudent(users, "Omar");
  addNewStudent(users, "Ahmed");

  print("Students Names:");
  displayStudents(users.toList(), 0);

  print("\nPrint Using forEach:");

  users.forEach((item) {
    print(item);
  });

  Set<String> addedStudents = {"Salma", "Youssef"};

  Set<String> studentsData = {
    ...users,
    ...addedStudents,
  };

  print("\nStudents After Combine:");

  studentsData.forEach((item) => print(item));

  Map<String, List<double>> gradesData = {};

  addSubject(gradesData, "Ahmed", "Math", 95);
  addSubject(gradesData, "Ahmed", "Physics", 88);
  addSubject(gradesData, "Omar", "Science");

  print("\nStudents GPA:");

  print("Ahmed : ${calculateAverage(gradesData, "Ahmed")}");
  print("Omar : ${calculateAverage(gradesData, "Omar")}");
}

void addNewStudent(Set<String> users, String student) {
  users.add(student);
}

void displayStudents(List<String> students, int counter) {
  if (counter == students.length) {
    return;
  }

  print(students[counter]);

  displayStudents(students, counter + 1);
}

void addSubject(
  Map<String, List<double>> data,
  String name,
  String subject, [
  double degree = 0,
]) {
  if (data.containsKey(name)) {
    data[name]!.add(degree);
  } else {
    data[name] = [degree];
  }
}

double calculateAverage(
  Map<String, List<double>> data,
  String name,
) {
  if (!data.containsKey(name) || data[name]!.isEmpty) {
    return 0;
  }

  List<double> result = data[name]!;

  double totalMarks =
      result.reduce((a, b) => a + b);

  return totalMarks / result.length;
}