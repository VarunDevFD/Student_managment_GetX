import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:std_get_x/controllers/student_getx_controller.dart';
import 'package:std_get_x/models/student_model.dart';

class StudentScreen extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final Student? selectedStudent;
  final Function(Student)? onStudentUpdated;

  StudentScreen({Key? key, this.selectedStudent, this.onStudentUpdated})
      : super(key: key) {
    if (selectedStudent != null) {
      nameController.text = selectedStudent!.name;
      ageController.text = selectedStudent!.age.toString();
      if (selectedStudent!.image.isNotEmpty) {
        studentController.pickImage(selectedStudent!.image);
      } else {
        studentController.clearImage();
      }
    } else {
     
      studentController.clearImage();
    }
  }

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      studentController.pickImage(base64Encode(bytes));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 108, 99, 19),
          ),
        ),
        title: Text(
          selectedStudent == null ? "Add Student" : "Edit Student",
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 108, 99, 19),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return CircleAvatar(
                backgroundColor: Colors.lime,
                radius: 90,
                backgroundImage: studentController.imageBase64.value.isNotEmpty
                    ? MemoryImage(
                        base64Decode(studentController.imageBase64.value))
                    : null,
                child: studentController.imageBase64.value.isEmpty
                    ? Icon(
                        Icons.image_outlined,
                        size: 60,
                        color: Colors.lime[50],
                      )
                    : null,
              );
            }),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.lime[200],
                    elevation: 5,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    'Pick Camera',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.lime[200],
                    elevation: 5,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    'Pick Image',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              shadowColor: Colors.lime[200],
              child: SizedBox(
                height: 50,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            Card(
              shadowColor: Colors.lime[200],
              child: SizedBox(
                height: 50,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Age',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lime[300],
                shadowColor: Colors.lime[200],
                elevation: 5,
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    ageController.text.isNotEmpty &&
                    studentController.imageBase64.value.isNotEmpty) {
                  final student = Student(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    image: studentController.imageBase64.value,
                  );
                  if (selectedStudent == null) {
                    studentController.addStudent(student);
                  } else {
                    onStudentUpdated?.call(student);
                  }
                  Navigator.pop(context);
                } else {
                  // Show GetX Snackbar for validation error
                  Get.snackbar(
                    'Error',
                    'Please fill all fields and select an image',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 108, 99, 19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
