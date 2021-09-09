import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home_page.dart';
import 'models/person.dart';
import 'models/pet.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('userData');
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(HairColorAdapter());
  Hive.registerAdapter(PetAdapter());
  await Hive.openBox<Person>('personList');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
