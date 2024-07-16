import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:std_get_x/models/student_model.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({Key? key, required this.student})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (student.image.isNotEmpty) {
      imageBytes = base64Decode(student.image);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: const Text(
          'Student Details',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 108, 99, 19),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.lime,
              backgroundImage:
                  imageBytes != null ? MemoryImage(imageBytes) : null,
              child: imageBytes == null
                  ? const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${student.name}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Age: ${student.age}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
