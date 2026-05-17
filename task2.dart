import 'dart:io';

void main() {
  List<String> students = [];
  List<List<double>> marks = [];

  int countStudents = 0;

  while (true) {
    stdout.write("Enter students count: ");
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      countStudents = int.parse(input);

      if (countStudents > 0) {
        break;
      }
    }

    print("Please enter a valid number!");
  }

  for (int i = 0; i < countStudents; i++) {
    stdout.write("Enter student name ${i + 1}: ");
    String? student = stdin.readLineSync();

    if (student == null || student.trim().isEmpty) {
      student = "Student_${i + 1}";
    }

    students.add(student);

    int subjects = 0;

    while (true) {
      stdout.write("Enter subjects count for $student: ");
      String? subInput = stdin.readLineSync();

      if (subInput != null && int.tryParse(subInput) != null) {
        subjects = int.parse(subInput);

        if (subjects > 0) {
          break;
        }
      }

      print("Invalid subjects count!");
    }

    List<double> degree = [];

    for (int j = 0; j < subjects; j++) {
      while (true) {
        stdout.write("Enter degree for subject ${j + 1}: ");
        String? degreeInput = stdin.readLineSync();

        if (degreeInput != null &&
            double.tryParse(degreeInput) != null) {
          double value = double.parse(degreeInput);

          if (value >= 0 && value <= 100) {
            degree.add(value);
            break;
          }
        }

        print("Degree must be from 0 to 100!");
      }
    }

    marks.add(degree);
  }

  while (true) {
    print("\n===== MENU =====");
    print("1. Display Results");
    print("2. Find Student");
    print("3. End Program");

    stdout.write("Choose: ");
    String? choose = stdin.readLineSync();

    if (choose == "1") {
      for (int i = 0; i < students.length; i++) {
        List<double> degree = marks[i];

        double average =
            degree.reduce((a, b) => a + b) / degree.length;

        print(
            "${students[i]} => Average: ${average.toStringAsFixed(2)} | Grade: ${getGrade(average)}");
      }
    } else if (choose == "2") {
      stdout.write("Enter student name: ");
      String? search = stdin.readLineSync();

      if (search != null) {
        int index = students.indexWhere(
          (e) => e.toLowerCase() == search.toLowerCase(),
        );

        if (index != -1) {
          double average =
              marks[index].reduce((a, b) => a + b) /
                  marks[index].length;

          print(
              "${students[index]} average = ${average.toStringAsFixed(1)}");
        } else {
          print("Student does not exist!");
        }
      }
    } else if (choose == "3") {
      print("Program closed.");
      break;
    } else {
      print("Wrong choice!");
    }
  }
}

String getGrade(double avg) {
  if (avg >= 90) {
    return "A";
  } else if (avg >= 80) {
    return "B";
  } else if (avg >= 70) {
    return "C";
  } else {
    return "F";
  }
}