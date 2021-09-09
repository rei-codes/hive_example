import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/person.dart';
import 'models/pet.dart';

class PersonListSection extends StatelessWidget {
  final personListBox = Hive.box<Person>('personList');

  add() {
    final person = Person(
      name: 'ehe',
      age: 25,
      pets: [
        Pet(name: 'dasti', age: 5),
        Pet(name: 'jack', age: 2),
      ],
      hairColor: HairColor.black,
    );
    personListBox.add(person);
  }

  removeLastPerson() {
    personListBox.deleteAt(personListBox.length - 1);
  }

  updateFirstPerson() {
    final firstPerson = personListBox.getAt(0);
    firstPerson!.name = firstPerson.name + 'ehe';
    firstPerson.age = firstPerson.age + 1;
    firstPerson.save();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Person List', style: TextStyle(fontSize: 20)),
        ValueListenableBuilder(
          valueListenable: personListBox.listenable(),
          builder: (context, Box<Person> box, _) {
            return Column(
              children: [
                ...List.generate(
                  personListBox.length,
                  (index) {
                    final person = personListBox.getAt(index)!;
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(person.age.toString()),
                            Text(person.hairColor.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(child: Text('Add'), onPressed: add),
            OutlinedButton(child: Text('Remove'), onPressed: removeLastPerson),
            OutlinedButton(
              child: Text('Update First Person'),
              onPressed: updateFirstPerson,
            ),
          ],
        ),
      ],
    );
  }
}
