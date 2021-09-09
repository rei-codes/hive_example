import 'package:hive/hive.dart';

import 'pet.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  List<Pet> pets;
  @HiveField(3)
  HairColor hairColor;
  Person({
    required this.name,
    required this.age,
    required this.pets,
    required this.hairColor,
  });
}

@HiveType(typeId: 2)
enum HairColor {
  @HiveField(0)
  brown,
  @HiveField(1)
  blond,
  @HiveField(2)
  black,
}
