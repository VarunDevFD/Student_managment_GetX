import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String image;

  Student({required this.name, required this.age, required this.image});
}
