import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:std_get_x/controllers/student_getx_controller.dart';
import 'package:std_get_x/pages/student_page.dart';
import 'package:std_get_x/pages/student_search_page.dart';

class HomeScreen extends StatelessWidget {
  final CreateStudents controller = Get.put(CreateStudents());
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
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentSearchScreen()),
                  );
                },
                icon: const Icon(
                  Icons.search_sharp,
                  size: 35,
                ),
              )
            ],
          )
        ],
      ),
      body: const Center(
        child: Text("Student"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StudentScreen()),
          );
        },
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
