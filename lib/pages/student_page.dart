import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

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
        title: const Text(
          "Student",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 108, 99, 19)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.lime,
              radius: 90,
              child: Icon(
                Icons.image_outlined,
                size: 60,
                color: Colors.lime[50],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
                    // controller: ,
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
                    // controller: ,
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
              onPressed: () {},
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
