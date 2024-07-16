import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:std_get_x/models/student_model.dart';

class StudentController extends GetxController {
  var students = <Student>[].obs;
  RxList<Student> filteredStudents = RxList<Student>();
  var imageBase64 = ''.obs;
  Box<Student> studentBox = Hive.box('students');

  @override
  void onInit() {
    super.onInit();
    loadStudents();
  }

  void loadStudents() {
    students.value = studentBox.values.toList();
  }

  void addStudent(Student student) {
    studentBox.add(student);
    loadStudents();
  }

  void updateStudent(int index, Student updatedStudent) {
    studentBox.putAt(index, updatedStudent);
    students[index] = updatedStudent;
  }

  void deleteStudent(int index) {
    studentBox.deleteAt(index);
    loadStudents();
  }

  void pickImage(String base64Image) {
    imageBase64.value = base64Image;
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents.value = students.toList();
    } else {
      filteredStudents.value = students
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
