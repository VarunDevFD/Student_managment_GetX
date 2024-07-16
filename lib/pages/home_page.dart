import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:std_get_x/controllers/student_getx_controller.dart';
import 'package:std_get_x/pages/student_detail_page.dart';
import 'package:std_get_x/pages/student_page.dart';
import 'package:std_get_x/pages/student_search_page.dart';

class HomeScreen extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: const Text(
          "Students",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 108, 99, 19),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const StudentSearchScreen());
            },
            icon: const Icon(
              Icons.search_sharp,
              size: 35,
            ),
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: studentController.students.length,
          itemBuilder: (context, index) {
            final student = studentController.students[index];

            return Card(
              color: Colors.lime[100],
              elevation: 2,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.lime,
                  child: student.image.isNotEmpty
                      ? ClipOval(
                          child: Image.memory(
                            base64Decode(student.image),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.error,
                                color: Colors.red,
                              );
                            },
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                ),
                title: Text(
                  student.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Age: ${student.age}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Wrap(
                  spacing: 12, // Space between each icon
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Get.to(
                          StudentScreen(
                            selectedStudent: student,
                            onStudentUpdated: (updatedStudent) {
                              studentController.updateStudent(
                                  index, updatedStudent);
                            },
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        studentController.deleteStudent(index);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(StudentDetailScreen(student: student));
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(StudentScreen()),
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
