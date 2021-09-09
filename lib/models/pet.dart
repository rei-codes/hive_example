import 'package:hive/hive.dart';

part 'pet.g.dart';

@HiveType(typeId: 3)
class Pet extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  Pet({required this.name, required this.age});
}
