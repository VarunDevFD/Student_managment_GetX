import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:std_get_x/controllers/student_getx_controller.dart';
import 'package:std_get_x/pages/student_detail_page.dart';

class StudentSearchScreen extends StatelessWidget {
  final StudentController studentController = Get.find<StudentController>();
  final TextEditingController searchController = TextEditingController();

  StudentSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Students List",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 108, 99, 19),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search Students...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                studentController.filterStudents(
                    value); // Call filterStudents from controller
              },
            ),
          ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: studentController.filteredStudents.length,
                itemBuilder: (context, index) {
                  final student = studentController.filteredStudents[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lime,
                      backgroundImage: student.image.isNotEmpty
                          ? MemoryImage(
                              base64Decode(student.image),
                            )
                          : null,
                      child: student.image.isEmpty
                          ? const Icon(
                              Icons.person,
                              color: Colors.white,
                            )
                          : null,
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
                    onTap: () {
                      Get.to(StudentDetailScreen(student: student));
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
